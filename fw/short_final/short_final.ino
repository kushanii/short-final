// Short Final

/*
*  Author: Iskender Kushan
*  Edits
*
*  04152020
*   Figured out how to start and stop timers. Guard LED sweep works.
*   introduced LED_ON as a flag to control the state of the LEDs.
*   Next: write the state machine.
*  04182020
*   State machine has two of the states written.
*   Tower LEDs now blink.
*   Active low LEDs are bitmasked by " ... || LED_ON_N", whereas the active high
*   ones are bitmasked by " ... && !LED_ON_N".
*   TODO: write the mode button debounce timer.
*         make more realistic tower LED light patterns.
*         I need to start introducing ticks to the timers since I am starting to
*         run out of them.
*  04202020
*   Plane three online. Need to implement a double flash though.
*   Tower patterns now match the pattern of Seattle antennas.
*   boost converter now controlled by the mcu
*   mode control button added, and debounced
*   dark mode added to the state machine
*  04212020
*   light sensor library integrated. now introducing light-induced
*   transitions to the state machine.
*   light transitions work!
*  04282020
*   added blinking upon power on.
*   fixed the bug mode button initial state bug.
*   plane 3 out of sync problem is solved.
*   started implementing the low battery mode.
*     state machine has a new state: low battery.
*     TODO: ADC functions to set the LOW_BATTERY flag. Need hysteresis.
*  05012020
*   low battery functions implemented with hysteresis.
*   TODO: right now I am re-purposing the sensor polling loop. feels hacky. can I do it in a better way?
*   TODO: what if the light sensor fails? can I gracefully make the board work using only the buttons?
*/

/*********************************************************************************/
// Preamble

// Libraries

#include <Timers.h>
#include <AsyncAPDS9306.h> //light sensor APDS9306

// Defines

#define DEBUG_SERIAL_BAUD_RATE 115200 

// Timer definitions

const byte GUARD_LED_TIMER = 0;
const byte GUARD_LED_PAUSE_TIMER = 1;

const byte TOWER_ONE_TIMER = 2;

const byte TOWER_TWO_TIMER = 3;

const byte TOWER_THREE_ON_TIMER = 4;
const byte TOWER_THREE_OFF_TIMER = 5;

const byte PLANE_ONE_BEACON_ON_TIMER = 6;
const byte PLANE_ONE_BEACON_OFF_TIMER = 7;
const byte PLANE_ONE_STROBE_ON_TIMER = 8;
const byte PLANE_ONE_STROBE_OFF_TIMER = 9;

const byte PLANE_TWO_BEACON_ON_TIMER = 10;
const byte PLANE_TWO_BEACON_OFF_TIMER = 11;
const byte PLANE_TWO_STROBE_ON_TIMER = 12;
const byte PLANE_TWO_STROBE_OFF_TIMER = 13;

const byte PLANE_THREE_BEACON_ON_TIMER = 14;
const byte PLANE_THREE_BEACON_OFF_TIMER = 15;
const byte PLANE_THREE_STROBE_ON_TIMER = 16;
const byte PLANE_THREE_STROBE_OFF_TIMER = 17;

//todo implement these
const byte PLANE_FOUR_BEACON_ON_TIMER = 18;
const byte PLANE_FOUR_BEACON_OFF_TIMER = 19;
const byte PLANE_FOUR_STROBE_ON_TIMER = 20;
const byte PLANE_FOUR_STROBE_OFF_TIMER = 21;

//end todo
const byte BATTERY_VOLTAGE_DEBOUNCE_TIMER = 29;
const byte LIGHT_SENSOR_DEBOUNCE_TIMER = 30;
const byte MODE_BUTTON_DEBOUNCE_TIMER = 31;

//Timer intervals

const int MODE_BUTTON_DEBOUNCE_TIMER_INTERVAL = 100;
const int BATTERY_VOLTAGE_DEBOUNCE_TIMER_INTERVAL = 100;

const int GUARD_LED_TIMER_INTERVAL = 60;
const int GUARD_LED_PAUSE_TIMER_INTERVAL = 250;

const int TOWER_ONE_TIMER_INTERVAL = 507;           //also randomize this

const int TOWER_TWO_TIMER_INTERVAL = 1007;          //TODO: figure out how to randomize this slightly.
												                            //say between 990 and 1010
const int TOWER_THREE_ON_TIMER_INTERVAL = 2000;      //also randomize this                                            
const int TOWER_THREE_OFF_TIMER_INTERVAL = 1200;    //also randomize this

//all the plane's timers are offset from each other by a few tens of ms.
//this is so that the plane timers slowly go out of sync - a nicer look.

const int PLANE_ONE_BEACON_ON_TIMER_INTERVAL = 60;
const int PLANE_ONE_BEACON_OFF_TIMER_INTERVAL = 1020; //2040 ms / 2
const int PLANE_ONE_STROBE_ON_TIMER_INTERVAL = 60;
const int PLANE_ONE_STROBE_OFF_TIMER_INTERVAL = 1980; //2040 ms - 60 ms

const int PLANE_TWO_BEACON_ON_TIMER_INTERVAL = 60;
const int PLANE_TWO_BEACON_OFF_TIMER_INTERVAL = 1000; //2000 ms / 2
const int PLANE_TWO_STROBE_ON_TIMER_INTERVAL = 60;
const int PLANE_TWO_STROBE_OFF_TIMER_INTERVAL = 1940; //2000 ms - 60 ms

const int PLANE_THREE_BEACON_ON_TIMER_INTERVAL = 60;
const int PLANE_THREE_BEACON_OFF_TIMER_INTERVAL = 800; //980 ms - 3*60 ms
const int PLANE_THREE_STROBE_ON_TIMER_INTERVAL = 60;
const int PLANE_THREE_STROBE_OFF_TIMER_INTERVAL = 1780; //1960 ms - 3*60 ms, since plane 3 strobes double

const int PLANE_FOUR_BEACON_ON_TIMER_INTERVAL = 60;
const int PLANE_FOUR_BEACON_OFF_TIMER_INTERVAL = 1030; //2060 ms / 2
const int PLANE_FOUR_STROBE_ON_TIMER_INTERVAL = 60;
const int PLANE_FOUR_STROBE_OFF_TIMER_INTERVAL = 2000; //2000 ms - 60 ms


// Flags

bool LED_ON_N = 1; //LED state flag
//active low
//LED_ON_N == 1 -> turn off all LED's
//LED_ON_N == 0 -> LED's enabled.

volatile bool LOW_BATTERY = 0;
//low battery flag
//LOW_BATTERY == 0 -> Battery OK
//LOW_BATTERY == 1 -> Battery low

bool TOWER_ONE_LED_STATE = 0;
byte TOWER_ONE_LED_TICKS = 0;
bool TOWER_TWO_LED_STATE = 0;
bool TOWER_THREE_LED_STATE = 0;

bool PLANE_ONE_BEACON_LED_STATE = 0;
bool PLANE_ONE_STROBE_LED_STATE = 0;

bool PLANE_TWO_BEACON_LED_STATE = 0;
bool PLANE_TWO_STROBE_LED_STATE = 0;

bool PLANE_THREE_BEACON_LED_STATE = 0;
bool PLANE_THREE_STROBE_LED_STATE = 0;
byte PLANE_THREE_STROBE_TIMER_TICKS = 0;

bool PLANE_FOUR_BEACON_LED_STATE = 0;
bool PLANE_FOUR_STROBE_LED_STATE = 0;

volatile bool MODE_BUTTON_STATE = 0; //initialize in the forced off state

//light sensor objects, constants and variables

AsyncAPDS9306 lightSensor;

const APDS9306_ALS_GAIN_t lightSensorGain = APDS9306_ALS_GAIN_1;
//measurement interval is 100ms.
const APDS9306_ALS_MEAS_RES_t lightSensorInterval = APDS9306_ALS_MEAS_RES_18BIT_100MS;
volatile int lightSensorRawReading = 0; //for the 100ms interval setting, this also ends up being equal to the light level in lux.
const int LIGHT_SENSOR_FALLING_THRESHOLD = 80; //this is the threshold for the light state -> dark state transition.
const int LIGHT_SENSOR_RISING_THRESHOLD = 100; //this is the threshold for the dark state -> light state transition.

// State Machine states

const byte POR_STATE = 0;
const byte FORCED_ON_STATE = 1;
const byte LIGHT_STATE = 2;
const byte DARK_STATE = 3;
const byte LOW_BATTERY_STATE = 4;

byte CURRENT_STATE = POR_STATE;
byte NEXT_STATE = POR_STATE;

// LED Pin Definitions
// TODO: define in comments which LED the pins correspond to.

const byte guideleds[] = { 32,30,12,28,31,11,9,25,24 }; //
const byte num_guideleds = 9;
byte current_guide_led = 0; //tracks which guide light led is on at a given time
/*
 * Guide LED Table
 * |  D85   |   32  |   DYNAMIC   |
 * |  D101  |   30  |   DYNAMIC   |
 * |  D100  |   12  |   DYNAMIC   |
 * |  D99   |   28  |   DYNAMIC   |
 * |  D102  |   31  |   DYNAMIC   |
 * |  D98   |   11  |   DYNAMIC   |
 * |  D97   |    9  |   DYNAMIC   |
 * |  D96   |   25  |   DYNAMIC   |
 * |  D86   |   24  |   DYNAMIC   |
 */

// PAPI light LEDs, which are static.
const byte papileds = 23;

//the aircraft static LEDs.
// CAUTION: 29 and 27 are shorted on the board because of my sad soldering. Always drive them together.
const byte staticleds1 = 13; //was 29
const byte staticleds2 = 5; //was 27

const byte towerleds[] = {14,33,15,16,17};
const byte num_towerleds = 5;
//parameter that is equal to the top led's on off ratio + 1
const byte TOWER_ONE_LED_ONOFF_RATIO = 4;
/*
 * Tower LED Table
 * |  D198,D197,D196  |   14  |   STATIC    |
 * |  D115            |   33  |   DYNAMIC   |
 * |  D199            |   15  |   DYNAMIC   |
 * |  D200,D133       |   16  |   DYNAMIC   |
 * |  D195,D201       |   17  |   DYNAMIC   |
 */

//dynamic plane LEDs

const byte plane1_strobes = 1;
const byte plane1_beacon = 22;

const byte plane2_strobes = 2;
const byte plane2_beacon = 21;

const byte plane3_strobes = 3;
const byte plane3_beacon = 20;

const byte plane4_strobes = 4;
const byte plane4_beacon = 6;

//boost converter enable pin. active high.

const byte boost_en = 7;

//mode select input pin

const byte mode_button_interrupt_pin = 8;

//battery voltage

const byte batteryVoltagePin = A14;
float batteryVoltage = 0;
const float batteryVoltage_lowThreshold = 2.2; //corresponds to 3.15V before the voltage divider.
const float batteryVoltage_highThreshold = 2.4; //corresponds to 3.4V before the voltage divider.

// Function prototypes

void InitHardware(void);
void modeButtonISR(void);
void ServiceTimers(void);

void RespLightSensorMeasurementReady(void);

//state machine functions. They return the next state in the state machine.
byte doPORState(void);
byte doForcedOnState(void);
byte doDarkState(void);
byte doLightState(void);
byte doLowBatteryState(void);

//updates all the static LEDs
void initAllLEDs(void);
void updateStaticLEDs(void);
void blinkLEDsPowerOn(void);

//timer functions
void initTimers(void);

byte TestModeButtonDebounceTimerExpired(void);
void RespModeButtonDebounceTimerTimerExpired(void);
byte TestModeButtonDebounceTimerTimerActive(void);

byte TestBatteryVoltageDebounceTimerExpired(void);
void RespBatteryVoltageDebounceTimerTimerExpired(void);
byte TestBatteryVoltageDebounceTimerTimerActive(void);

byte TestGuardLEDTimerExpired(void);
void RespGuardLEDTimerExpired(void);
byte TestGuardLEDTimerActive(void);

byte TestGuardLEDPauseTimerExpired(void);
byte TestGuardLEDPauseTimerActive(void);
void RespGuardLEDPauseTimerExpired(void);

byte TestTowerOneTimerExpired(void);
byte TestTowerOneTimerActive(void);
void RespTowerOneTimerExpired(void);

byte TestTowerTwoTimerExpired(void);
byte TestTowerTwoTimerActive(void);
void RespTowerTwoTimerExpired(void);

byte TestTowerThreeOnTimerExpired(void);
byte TestTowerThreeOnTimerActive(void);
void RespTowerThreeOnTimerExpired(void);

byte TestTowerThreeOffTimerExpired(void);
byte TestTowerThreeOffTimerActive(void);
void RespTowerThreeOffTimerExpired(void);

/////////////////////////////////////////////////
// Plane 1 Timer Function Prototypes
/////////////////////////////////////////////////
byte TestPlaneOneBeaconOnTimerExpired(void);
byte TestPlaneOneBeaconOnTimerActive(void);
void RespPlaneOneBeaconOnTimerExpired(void);

byte TestPlaneOneBeaconOffTimerExpired(void);
byte TestPlaneOneBeaconOffTimerActive(void);
void RespPlaneOneBeaconOffTimerExpired(void);

byte TestPlaneOneStrobeOnTimerExpired(void);
byte TestPlaneOneStrobeOnTimerActive(void);
void RespPlaneOneStrobeOnTimerExpired(void);

byte TestPlaneOneStrobeOffTimerExpired(void);
byte TestPlaneOneStrobeOffTimerActive(void);
void RespPlaneOneStrobeOffTimerExpired(void);

/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane 2 Timer Function Prototypes
/////////////////////////////////////////////////
byte TestPlaneTwoBeaconOnTimerExpired(void);
byte TestPlaneTwoBeaconOnTimerActive(void);
void RespPlaneTwoBeaconOnTimerExpired(void);

byte TestPlaneTwoBeaconOffTimerExpired(void);
byte TestPlaneTwoBeaconOffTimerActive(void);
void RespPlaneTwoBeaconOffTimerExpired(void);

byte TestPlaneTwoStrobeOnTimerExpired(void);
byte TestPlaneTwoStrobeOnTimerActive(void);
void RespPlaneTwoStrobeOnTimerExpired(void);

byte TestPlaneTwoStrobeOffTimerExpired(void);
byte TestPlaneTwoStrobeOffTimerActive(void);
void RespPlaneTwoStrobeOffTimerExpired(void);
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane 3 Timer Function Prototypes
/////////////////////////////////////////////////
byte TestPlaneThreeBeaconOnTimerExpired(void);
byte TestPlaneThreeBeaconOnTimerActive(void);
void RespPlaneThreeBeaconOnTimerExpired(void);

byte TestPlaneThreeBeaconOffTimerExpired(void);
byte TestPlaneThreeBeaconOffTimerActive(void);
void RespPlaneThreeBeaconOffTimerExpired(void);

byte TestPlaneThreeStrobeOnTimerExpired(void);
byte TestPlaneThreeStrobeOnTimerActive(void);
void RespPlaneThreeStrobeOnTimerExpired(void);

byte TestPlaneThreeStrobeOffTimerExpired(void);
byte TestPlaneThreeStrobeOffTimerActive(void);
void RespPlaneThreeStrobeOffTimerExpired(void);
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane 4 Timer Function Prototypes
/////////////////////////////////////////////////
byte TestPlaneFourBeaconOnTimerExpired(void);
byte TestPlaneFourBeaconOnTimerActive(void);
void RespPlaneFourBeaconOnTimerExpired(void);

byte TestPlaneFourBeaconOffTimerExpired(void);
byte TestPlaneFourBeaconOffTimerActive(void);
void RespPlaneFourBeaconOffTimerExpired(void);

byte TestPlaneFourStrobeOnTimerExpired(void);
byte TestPlaneFourStrobeOnTimerActive(void);
void RespPlaneFourStrobeOnTimerExpired(void);

byte TestPlaneFourStrobeOffTimerExpired(void);
byte TestPlaneFourStrobeOffTimerActive(void);
void RespPlaneFourStrobeOffTimerExpired(void);
/////////////////////////////////////////////////

/*********************************************************************************/
// Main Program

void setup() {
	InitHardware();

  //blink all the static LED's twice upon power on
  blinkLEDsPowerOn();

  //read the mode button's initial state
  MODE_BUTTON_STATE = digitalRead(mode_button_interrupt_pin);

  //read the battery voltage

  batteryVoltage = 3.3*(analogRead(batteryVoltagePin)/1024.0);
  
  //initialize the timers
  initTimers();
}

void loop() {

  //service the timers
  ServiceTimers();

  //service the light sensor
  if(lightSensor.isMeasurementReady()){
    RespLightSensorMeasurementReady();

    //measure the battery voltage
    //coopting the light sensor measurement ready function for now.
    //TODO FIX THIS
    batteryVoltage = 3.3*(analogRead(batteryVoltagePin)/1024.0);
    Serial.print("VBAT = ");
    Serial.println(batteryVoltage);
    //battery voltage hysteresis
    if (batteryVoltage < batteryVoltage_lowThreshold){
      LOW_BATTERY = 1;
    }
    else if (batteryVoltage > batteryVoltage_highThreshold){
      LOW_BATTERY = 0;
    }
  }
  
  //Serial.print("BAT STATE = ");
  //Serial.println(LOW_BATTERY);
  
	//run the state machine
	switch (CURRENT_STATE) {
	case POR_STATE:
	{
		NEXT_STATE = doPORState();
		break;
	}
	case FORCED_ON_STATE:
	{
		NEXT_STATE = doForcedOnState();
		break;
	}
  case DARK_STATE:
  {
    NEXT_STATE = doDarkState();
    break;
  }
  case LIGHT_STATE:
  {
    NEXT_STATE = doLightState();
    break;
  }
  case LOW_BATTERY_STATE:
  {
    NEXT_STATE = doLowBatteryState();
    break;
  }
	default:
		break;
	}

  //Serial.print("CURRENT STATE = ");
  //Serial.println(CURRENT_STATE);
  
	//update the state machine's state
	CURRENT_STATE = NEXT_STATE;
}

//blinks the static LED's upon power on.
//this is the only place in the program where delay() statements are used.
void blinkLEDsPowerOn(void){
  delay(1000);
  LED_ON_N = 0;
  updateStaticLEDs();
  delay(1000);
  LED_ON_N = 1;
  updateStaticLEDs();
  delay(1000);
  LED_ON_N = 0;
  updateStaticLEDs();
  delay(1000);
  LED_ON_N = 1;
  updateStaticLEDs();
  delay(1000);
  return;
}

//State Machine Functions

//for now, always go to the light state after POR.
byte doPORState(void) {
  return LIGHT_STATE;
}

byte doForcedOnState(void) {
  LED_ON_N = 0; //enable the LEDs. Remember this is an active low flag!
  digitalWrite(boost_en,HIGH); //turn on the boost converter.
  updateStaticLEDs();
  if (LOW_BATTERY == 1) return LOW_BATTERY_STATE;
  if ((MODE_BUTTON_STATE == 0) && (lightSensorRawReading < LIGHT_SENSOR_FALLING_THRESHOLD) ) return DARK_STATE;
  else if ((MODE_BUTTON_STATE == 0) && (lightSensorRawReading >= LIGHT_SENSOR_FALLING_THRESHOLD) ) return LIGHT_STATE;
  else return FORCED_ON_STATE; //this is returned if the forced on mode button is pressed.
}


byte doDarkState(void) {
  LED_ON_N = 0; //enable the LEDs. Remember this is an active low flag!
  digitalWrite(boost_en,HIGH); //turn on the boost converter.
  updateStaticLEDs();
  if (LOW_BATTERY == 1) return LOW_BATTERY_STATE;
  if ((MODE_BUTTON_STATE == 0) && (lightSensorRawReading < LIGHT_SENSOR_RISING_THRESHOLD) ) return DARK_STATE;
  else if ((MODE_BUTTON_STATE == 0) && (lightSensorRawReading >= LIGHT_SENSOR_RISING_THRESHOLD) ) return LIGHT_STATE;
  else return FORCED_ON_STATE; //this is returned if the forced on mode button is pressed.
}


byte doLightState(void){
  LED_ON_N = 1; //disable the LEDs. Remember this is an active low flag!
  digitalWrite(boost_en,LOW); //turn off the boost converter.
  updateStaticLEDs();
  if (LOW_BATTERY == 1) return LOW_BATTERY_STATE;
  if ((MODE_BUTTON_STATE == 0) && (lightSensorRawReading < LIGHT_SENSOR_FALLING_THRESHOLD) ) return DARK_STATE;
  else if ((MODE_BUTTON_STATE == 0) && (lightSensorRawReading >= LIGHT_SENSOR_FALLING_THRESHOLD) ) return LIGHT_STATE;
  else return FORCED_ON_STATE; //this is returned if the forced on mode button is pressed.
}


byte doLowBatteryState(void) {
  LED_ON_N = 1; //disable the LEDs. Remember this is an active low flag!
  digitalWrite(boost_en,LOW); //turn off the boost converter.
  updateStaticLEDs();
  if (LOW_BATTERY == 1) return LOW_BATTERY_STATE;
  else return LIGHT_STATE;
}





void ServiceTimers(void){
  //service the timers
  if (TestModeButtonDebounceTimerExpired() && TestModeButtonDebounceTimerActive()) RespModeButtonDebounceTimerExpired();
  
  if (TestGuardLEDTimerExpired() && TestGuardLEDTimerActive()) RespGuardLEDTimerExpired();
  if (TestGuardLEDPauseTimerExpired() && TestGuardLEDPauseTimerActive()) RespGuardLEDPauseTimerExpired();
 
  if (TestTowerOneTimerExpired() && TestTowerOneTimerActive()) RespTowerOneTimerExpired();
  
  if (TestTowerTwoTimerExpired() && TestTowerTwoTimerActive()) RespTowerTwoTimerExpired();

  if (TestTowerThreeOnTimerExpired() && TestTowerThreeOnTimerActive()) RespTowerThreeOnTimerExpired();
  if (TestTowerThreeOffTimerExpired() && TestTowerThreeOffTimerActive()) RespTowerThreeOffTimerExpired();

  if (TestPlaneOneBeaconOnTimerExpired() && TestPlaneOneBeaconOnTimerActive()) RespPlaneOneBeaconOnTimerExpired();
  if (TestPlaneOneBeaconOffTimerExpired() && TestPlaneOneBeaconOffTimerActive()) RespPlaneOneBeaconOffTimerExpired();

  if (TestPlaneOneStrobeOnTimerExpired() && TestPlaneOneStrobeOnTimerActive()) RespPlaneOneStrobeOnTimerExpired();
  if (TestPlaneOneStrobeOffTimerExpired() && TestPlaneOneStrobeOffTimerActive()) RespPlaneOneStrobeOffTimerExpired();

  if (TestPlaneTwoBeaconOnTimerExpired() && TestPlaneTwoBeaconOnTimerActive()) RespPlaneTwoBeaconOnTimerExpired();
  if (TestPlaneTwoBeaconOffTimerExpired() && TestPlaneTwoBeaconOffTimerActive()) RespPlaneTwoBeaconOffTimerExpired();

  if (TestPlaneTwoStrobeOnTimerExpired() && TestPlaneTwoStrobeOnTimerActive()) RespPlaneTwoStrobeOnTimerExpired();
  if (TestPlaneTwoStrobeOffTimerExpired() && TestPlaneTwoStrobeOffTimerActive()) RespPlaneTwoStrobeOffTimerExpired();

  if (TestPlaneThreeBeaconOnTimerExpired() && TestPlaneThreeBeaconOnTimerActive()) RespPlaneThreeBeaconOnTimerExpired();
  if (TestPlaneThreeBeaconOffTimerExpired() && TestPlaneThreeBeaconOffTimerActive()) RespPlaneThreeBeaconOffTimerExpired();

  if (TestPlaneThreeStrobeOnTimerExpired() && TestPlaneThreeStrobeOnTimerActive()) RespPlaneThreeStrobeOnTimerExpired();
  if (TestPlaneThreeStrobeOffTimerExpired() && TestPlaneThreeStrobeOffTimerActive()) RespPlaneThreeStrobeOffTimerExpired();

  if (TestPlaneFourBeaconOnTimerExpired() && TestPlaneFourBeaconOnTimerActive()) RespPlaneFourBeaconOnTimerExpired();
  if (TestPlaneFourBeaconOffTimerExpired() && TestPlaneFourBeaconOffTimerActive()) RespPlaneFourBeaconOffTimerExpired();

  if (TestPlaneFourStrobeOnTimerExpired() && TestPlaneFourStrobeOnTimerActive()) RespPlaneFourStrobeOnTimerExpired();
  if (TestPlaneFourStrobeOffTimerExpired() && TestPlaneFourStrobeOffTimerActive()) RespPlaneFourStrobeOffTimerExpired();

  return;
}

void InitHardware(void) {

  //initialize all the LEDs
  initAllLEDs();
  
  //start the debug serial
  Serial.begin(DEBUG_SERIAL_BAUD_RATE);

  //initialize the light sensor
  if (lightSensor.begin(lightSensorGain, lightSensorInterval)) {
    Serial.println("Sensor found !");
    lightSensor.startLuminosityMeasurement(); //start measuring
  } else {
    Serial.println("Sensor not found !");
  }
  
  //set up the mode button debounce interrupt
  pinMode(mode_button_interrupt_pin,INPUT);
  attachInterrupt(digitalPinToInterrupt(mode_button_interrupt_pin), modeButtonISR, CHANGE);

  //initialize the boost converter
  pinMode(boost_en,OUTPUT);
  digitalWrite(boost_en,LOW);

	return;
}

//ISRs

void initTimers(void){
  //initialize the timers

  //generate a random seed from A13 (floating analog input)
  randomSeed(analogRead(A13)); //TODO DEFINE A PIN HERE
  int PLANE_TWO_TIMER_OFFSET = random(0, 1000);
  int PLANE_THREE_TIMER_OFFSET = random(0, 1000);
  int PLANE_FOUR_TIMER_OFFSET = random(0, 1000);


  /////////////////////////////////////////////////
  // Mode Button Debounce Timer Initialization
  /////////////////////////////////////////////////
  TMRArd_InitTimer(MODE_BUTTON_DEBOUNCE_TIMER, MODE_BUTTON_DEBOUNCE_TIMER_INTERVAL);
  TMRArd_StopTimer(MODE_BUTTON_DEBOUNCE_TIMER);
  /////////////////////////////////////////////////

  /////////////////////////////////////////////////
  // Tower Timers Initialization
  /////////////////////////////////////////////////
  TMRArd_InitTimer(GUARD_LED_TIMER, GUARD_LED_TIMER_INTERVAL);
  TMRArd_InitTimer(GUARD_LED_PAUSE_TIMER, GUARD_LED_PAUSE_TIMER_INTERVAL);
  TMRArd_StopTimer(GUARD_LED_PAUSE_TIMER);
  /////////////////////////////////////////////////

  /////////////////////////////////////////////////
  // Tower Timers Initialization
  /////////////////////////////////////////////////
  TMRArd_InitTimer(TOWER_ONE_TIMER, TOWER_ONE_TIMER_INTERVAL);
  TMRArd_InitTimer(TOWER_TWO_TIMER, TOWER_TWO_TIMER_INTERVAL);
  TMRArd_InitTimer(TOWER_THREE_ON_TIMER, TOWER_THREE_ON_TIMER_INTERVAL);
  TMRArd_InitTimer(TOWER_THREE_OFF_TIMER, TOWER_THREE_OFF_TIMER_INTERVAL);
  //stop the off timer immediately, since only one tower three timer should be active at any time
  TMRArd_StopTimer(TOWER_THREE_OFF_TIMER);
  /////////////////////////////////////////////////

  /////////////////////////////////////////////////
  // Plane 1 Timer Initialization
  /////////////////////////////////////////////////
  TMRArd_InitTimer(PLANE_ONE_BEACON_ON_TIMER, PLANE_ONE_BEACON_ON_TIMER_INTERVAL);
  TMRArd_StopTimer(PLANE_ONE_BEACON_ON_TIMER);
  TMRArd_InitTimer(PLANE_ONE_BEACON_OFF_TIMER, PLANE_ONE_BEACON_OFF_TIMER_INTERVAL);
  TMRArd_StopTimer(PLANE_ONE_BEACON_OFF_TIMER);
  //beacon timers are stopped immediately, since their timing is kept syncronized from the strobe timer

  TMRArd_InitTimer(PLANE_ONE_STROBE_ON_TIMER, PLANE_ONE_STROBE_ON_TIMER_INTERVAL);
  
  TMRArd_InitTimer(PLANE_ONE_STROBE_OFF_TIMER, PLANE_ONE_STROBE_OFF_TIMER_INTERVAL);
  //stop the off timer immediately, since only one plane one strobe timer should be active at any time
  TMRArd_StopTimer(PLANE_ONE_STROBE_OFF_TIMER);
  /////////////////////////////////////////////////

  /////////////////////////////////////////////////
  // Plane 2 Timer Initialization
  /////////////////////////////////////////////////
  TMRArd_InitTimer(PLANE_TWO_BEACON_ON_TIMER, PLANE_TWO_BEACON_ON_TIMER_INTERVAL);
  TMRArd_StopTimer(PLANE_TWO_BEACON_ON_TIMER);
  TMRArd_InitTimer(PLANE_TWO_BEACON_OFF_TIMER, PLANE_TWO_BEACON_OFF_TIMER_INTERVAL);
  TMRArd_StopTimer(PLANE_TWO_BEACON_OFF_TIMER);
  //beacon timers are stopped immediately, since their timing is kept syncronized from the strobe timer

  TMRArd_InitTimer(PLANE_TWO_STROBE_ON_TIMER, PLANE_TWO_STROBE_ON_TIMER_INTERVAL);
  TMRArd_SetTimer(PLANE_TWO_STROBE_ON_TIMER, PLANE_TWO_TIMER_OFFSET);
  TMRArd_StartTimer(PLANE_TWO_STROBE_ON_TIMER);
  
  TMRArd_InitTimer(PLANE_TWO_STROBE_OFF_TIMER, PLANE_TWO_STROBE_OFF_TIMER_INTERVAL);
  //stop the off timer immediately, since only one plane one strobe timer should be active at any time
  TMRArd_StopTimer(PLANE_TWO_STROBE_OFF_TIMER);
  /////////////////////////////////////////////////

  /////////////////////////////////////////////////
  // Plane 3 Timer Initialization
  /////////////////////////////////////////////////
  TMRArd_InitTimer(PLANE_THREE_BEACON_ON_TIMER, PLANE_THREE_BEACON_ON_TIMER_INTERVAL);
  TMRArd_StopTimer(PLANE_THREE_BEACON_ON_TIMER);
  TMRArd_InitTimer(PLANE_THREE_BEACON_OFF_TIMER, PLANE_THREE_BEACON_OFF_TIMER_INTERVAL);
  TMRArd_StopTimer(PLANE_THREE_BEACON_OFF_TIMER);
  //beacon timers are stopped immediately, since their timing is kept syncronized from the strobe timer

  TMRArd_InitTimer(PLANE_THREE_STROBE_ON_TIMER, PLANE_THREE_STROBE_ON_TIMER_INTERVAL);
  TMRArd_SetTimer(PLANE_THREE_STROBE_ON_TIMER, PLANE_THREE_TIMER_OFFSET);
  TMRArd_StartTimer(PLANE_THREE_STROBE_ON_TIMER);
  
  TMRArd_InitTimer(PLANE_THREE_STROBE_OFF_TIMER, PLANE_THREE_STROBE_OFF_TIMER_INTERVAL);
  //stop the off timer immediately, since only one plane one strobe timer should be active at any time
  TMRArd_StopTimer(PLANE_THREE_STROBE_OFF_TIMER);
  /////////////////////////////////////////////////

  /////////////////////////////////////////////////
  // Plane 4 Timer Initialization
  /////////////////////////////////////////////////
  TMRArd_InitTimer(PLANE_FOUR_BEACON_ON_TIMER, PLANE_FOUR_BEACON_ON_TIMER_INTERVAL);
  TMRArd_StopTimer(PLANE_FOUR_BEACON_ON_TIMER);
  TMRArd_InitTimer(PLANE_FOUR_BEACON_OFF_TIMER, PLANE_FOUR_BEACON_OFF_TIMER_INTERVAL);
  TMRArd_StopTimer(PLANE_FOUR_BEACON_OFF_TIMER);
  //beacon timers are stopped immediately, since their timing is kept syncronized from the strobe timer

  TMRArd_InitTimer(PLANE_FOUR_STROBE_ON_TIMER, PLANE_FOUR_STROBE_ON_TIMER_INTERVAL);
  TMRArd_SetTimer(PLANE_FOUR_STROBE_ON_TIMER, PLANE_FOUR_TIMER_OFFSET);
  TMRArd_StartTimer(PLANE_FOUR_STROBE_ON_TIMER);
  
  TMRArd_InitTimer(PLANE_FOUR_STROBE_OFF_TIMER, PLANE_FOUR_STROBE_OFF_TIMER_INTERVAL);
  //stop the off timer immediately, since only one plane one strobe timer should be active at any time
  TMRArd_StopTimer(PLANE_FOUR_STROBE_OFF_TIMER);
  /////////////////////////////////////////////////
  return;
}

void modeButtonISR(void){
  TMRArd_InitTimer(MODE_BUTTON_DEBOUNCE_TIMER, MODE_BUTTON_DEBOUNCE_TIMER_INTERVAL);
  return;
}

/////////////////////////////////////////////////
// Mode Button Debounce Timer Functions
/////////////////////////////////////////////////
byte TestModeButtonDebounceTimerExpired(void) {
  return (byte)(TMRArd_IsTimerExpired(MODE_BUTTON_DEBOUNCE_TIMER));
}

byte TestModeButtonDebounceTimerActive(void) {
  return (byte)(TMRArd_IsTimerActive(MODE_BUTTON_DEBOUNCE_TIMER));
}

void RespModeButtonDebounceTimerExpired(void) {
  TMRArd_ClearTimerExpired(MODE_BUTTON_DEBOUNCE_TIMER);
  Serial.println("Button!");
  MODE_BUTTON_STATE = digitalRead(mode_button_interrupt_pin);
  TMRArd_StopTimer(MODE_BUTTON_DEBOUNCE_TIMER);
  return;
}
/////////////////////////////////////////////////

/////////////////////////////////////////////////
// Tower One Timer Functions
/////////////////////////////////////////////////
byte TestTowerOneTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(TOWER_ONE_TIMER));
}

byte TestTowerOneTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(TOWER_ONE_TIMER));
}

void RespTowerOneTimerExpired(void) {
	TMRArd_ClearTimerExpired(TOWER_ONE_TIMER);
  //Serial.println("Tower 1!");
  if (TOWER_ONE_LED_TICKS != (TOWER_ONE_LED_ONOFF_RATIO-1)){
      TOWER_ONE_LED_STATE = 0 ; //tower one LEDs are active low
  }
  else{
      TOWER_ONE_LED_STATE = 1 ; //tower one LEDs are active low
  }
	digitalWrite(towerleds[1], TOWER_ONE_LED_STATE || LED_ON_N);
	digitalWrite(towerleds[2], !TOWER_ONE_LED_STATE || LED_ON_N);
	TMRArd_InitTimer(TOWER_ONE_TIMER, TOWER_ONE_TIMER_INTERVAL);
  TOWER_ONE_LED_TICKS = (TOWER_ONE_LED_TICKS + 1) % TOWER_ONE_LED_ONOFF_RATIO;
	return;
}
/////////////////////////////////////////////////

/////////////////////////////////////////////////
// Tower Two Timer Functions
/////////////////////////////////////////////////

byte TestTowerTwoTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(TOWER_TWO_TIMER));
}

byte TestTowerTwoTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(TOWER_TWO_TIMER));
}

//tower two is also used as a low battery indicator.

void RespTowerTwoTimerExpired(void) {
	TMRArd_ClearTimerExpired(TOWER_TWO_TIMER);
	TOWER_TWO_LED_STATE = !TOWER_TWO_LED_STATE;
	digitalWrite(towerleds[3], TOWER_TWO_LED_STATE || (LED_ON_N && !LOW_BATTERY));
	TMRArd_InitTimer(TOWER_TWO_TIMER, TOWER_TWO_TIMER_INTERVAL);
	return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Tower Three On Timer Functions
/////////////////////////////////////////////////

byte TestTowerThreeOnTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(TOWER_THREE_ON_TIMER));
}

byte TestTowerThreeOnTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(TOWER_THREE_ON_TIMER));
}

void RespTowerThreeOnTimerExpired(void) {
	TMRArd_ClearTimerExpired(TOWER_THREE_ON_TIMER);
	TMRArd_StopTimer(TOWER_THREE_ON_TIMER);
	TOWER_THREE_LED_STATE = HIGH; //turn off the tower three LED
	digitalWrite(towerleds[4], TOWER_THREE_LED_STATE || LED_ON_N);
	TMRArd_InitTimer(TOWER_THREE_OFF_TIMER, TOWER_THREE_OFF_TIMER_INTERVAL);
	return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Tower Three Off Timer Functions
/////////////////////////////////////////////////

byte TestTowerThreeOffTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(TOWER_THREE_OFF_TIMER));
}

byte TestTowerThreeOffTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(TOWER_THREE_OFF_TIMER));
}

void RespTowerThreeOffTimerExpired(void) {
	TMRArd_ClearTimerExpired(TOWER_THREE_OFF_TIMER);
	TMRArd_StopTimer(TOWER_THREE_OFF_TIMER);
	TOWER_THREE_LED_STATE = LOW; //turn off the tower three LED
	digitalWrite(towerleds[4], TOWER_THREE_LED_STATE || LED_ON_N);
	TMRArd_InitTimer(TOWER_THREE_ON_TIMER, TOWER_THREE_ON_TIMER_INTERVAL);
	return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane One Beacon On Timer
/////////////////////////////////////////////////

byte TestPlaneOneBeaconOnTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(PLANE_ONE_BEACON_ON_TIMER));
}

byte TestPlaneOneBeaconOnTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(PLANE_ONE_BEACON_ON_TIMER));
}

void RespPlaneOneBeaconOnTimerExpired(void) {
	TMRArd_ClearTimerExpired(PLANE_ONE_BEACON_ON_TIMER);
	TMRArd_StopTimer(PLANE_ONE_BEACON_ON_TIMER);
	PLANE_ONE_BEACON_LED_STATE = HIGH; //turn off the plane one beacon LED
	digitalWrite(plane1_beacon, PLANE_ONE_BEACON_LED_STATE || LED_ON_N);
	//do not initialize any timers. The strobe off timer will initialize the beacon off timer.
	return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane One Beacon Off Timer
/////////////////////////////////////////////////

byte TestPlaneOneBeaconOffTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(PLANE_ONE_BEACON_OFF_TIMER));
}

byte TestPlaneOneBeaconOffTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(PLANE_ONE_BEACON_OFF_TIMER));
}

void RespPlaneOneBeaconOffTimerExpired(void) {
	TMRArd_ClearTimerExpired(PLANE_ONE_BEACON_OFF_TIMER);
	TMRArd_StopTimer(PLANE_ONE_BEACON_OFF_TIMER);
	PLANE_ONE_BEACON_LED_STATE = LOW; //turn off the plane one beacon LED
	digitalWrite(plane1_beacon, PLANE_ONE_BEACON_LED_STATE || LED_ON_N);
	TMRArd_InitTimer(PLANE_ONE_BEACON_ON_TIMER, PLANE_ONE_BEACON_ON_TIMER_INTERVAL);
	return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane One Strobe On Timer
/////////////////////////////////////////////////

byte TestPlaneOneStrobeOnTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(PLANE_ONE_STROBE_ON_TIMER));
}

byte TestPlaneOneStrobeOnTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(PLANE_ONE_STROBE_ON_TIMER));
}

void RespPlaneOneStrobeOnTimerExpired(void) {
	TMRArd_ClearTimerExpired(PLANE_ONE_STROBE_ON_TIMER);
	TMRArd_StopTimer(PLANE_ONE_STROBE_ON_TIMER);
	PLANE_ONE_STROBE_LED_STATE = LOW; //turn off the plane one strobe LED
	digitalWrite(plane1_strobes, PLANE_ONE_STROBE_LED_STATE && !LED_ON_N);
	TMRArd_InitTimer(PLANE_ONE_STROBE_OFF_TIMER, PLANE_ONE_STROBE_OFF_TIMER_INTERVAL);
	return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane One Strobe Off Timer
/////////////////////////////////////////////////

byte TestPlaneOneStrobeOffTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(PLANE_ONE_STROBE_OFF_TIMER));
}

byte TestPlaneOneStrobeOffTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(PLANE_ONE_STROBE_OFF_TIMER));
}

void RespPlaneOneStrobeOffTimerExpired(void) {
	TMRArd_ClearTimerExpired(PLANE_ONE_STROBE_OFF_TIMER);
	TMRArd_StopTimer(PLANE_ONE_STROBE_OFF_TIMER);
	PLANE_ONE_STROBE_LED_STATE = HIGH; //turn off the plane one strobe LED
	digitalWrite(plane1_strobes, PLANE_ONE_STROBE_LED_STATE && !LED_ON_N);
	TMRArd_InitTimer(PLANE_ONE_STROBE_ON_TIMER, PLANE_ONE_STROBE_ON_TIMER_INTERVAL);
  TMRArd_InitTimer(PLANE_ONE_BEACON_OFF_TIMER, PLANE_ONE_BEACON_OFF_TIMER_INTERVAL);
	return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane Two Beacon On Timer
/////////////////////////////////////////////////

byte TestPlaneTwoBeaconOnTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(PLANE_TWO_BEACON_ON_TIMER));
}

byte TestPlaneTwoBeaconOnTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(PLANE_TWO_BEACON_ON_TIMER));
}

void RespPlaneTwoBeaconOnTimerExpired(void) {
	TMRArd_ClearTimerExpired(PLANE_TWO_BEACON_ON_TIMER);
	TMRArd_StopTimer(PLANE_TWO_BEACON_ON_TIMER);
	PLANE_TWO_BEACON_LED_STATE = LOW; //turn off the plane one strobe LED
	digitalWrite(plane2_beacon, PLANE_TWO_BEACON_LED_STATE && !LED_ON_N);
	//TMRArd_InitTimer(PLANE_TWO_BEACON_OFF_TIMER, PLANE_TWO_BEACON_OFF_TIMER_INTERVAL);
	return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane Two Beacon Off Timer
/////////////////////////////////////////////////

byte TestPlaneTwoBeaconOffTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(PLANE_TWO_BEACON_OFF_TIMER));
}

byte TestPlaneTwoBeaconOffTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(PLANE_TWO_BEACON_OFF_TIMER));
}

void RespPlaneTwoBeaconOffTimerExpired(void) {
	TMRArd_ClearTimerExpired(PLANE_TWO_BEACON_OFF_TIMER);
	TMRArd_StopTimer(PLANE_TWO_BEACON_OFF_TIMER);
	PLANE_TWO_BEACON_LED_STATE = HIGH; //turn on the plane one strobe LED
	digitalWrite(plane2_beacon, PLANE_TWO_BEACON_LED_STATE && !LED_ON_N);
	TMRArd_InitTimer(PLANE_TWO_BEACON_ON_TIMER, PLANE_TWO_BEACON_ON_TIMER_INTERVAL);
	return;
}
/////////////////////////////////////////////////

/////////////////////////////////////////////////
// Plane Two Strobe On Timer
/////////////////////////////////////////////////

byte TestPlaneTwoStrobeOnTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(PLANE_TWO_STROBE_ON_TIMER));
}

byte TestPlaneTwoStrobeOnTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(PLANE_TWO_STROBE_ON_TIMER));
}

void RespPlaneTwoStrobeOnTimerExpired(void) {
	TMRArd_ClearTimerExpired(PLANE_TWO_STROBE_ON_TIMER);
	TMRArd_StopTimer(PLANE_TWO_STROBE_ON_TIMER);
	//Serial.println("Plane 2 Strobe OFF!");
	PLANE_TWO_STROBE_LED_STATE = LOW; //turn off the plane one strobe LED
	digitalWrite(plane2_strobes, PLANE_TWO_STROBE_LED_STATE && !LED_ON_N);
	TMRArd_InitTimer(PLANE_TWO_STROBE_OFF_TIMER, PLANE_TWO_STROBE_OFF_TIMER_INTERVAL);
  TMRArd_InitTimer(PLANE_TWO_BEACON_OFF_TIMER, PLANE_TWO_BEACON_OFF_TIMER_INTERVAL);
	return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane Two Strobe Off Timer
/////////////////////////////////////////////////

byte TestPlaneTwoStrobeOffTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(PLANE_TWO_STROBE_OFF_TIMER));
}

byte TestPlaneTwoStrobeOffTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(PLANE_TWO_STROBE_OFF_TIMER));
}

void RespPlaneTwoStrobeOffTimerExpired(void) {
	TMRArd_ClearTimerExpired(PLANE_TWO_STROBE_OFF_TIMER);
	TMRArd_StopTimer(PLANE_TWO_STROBE_OFF_TIMER);
	//Serial.println("Plane 2 Strobe ON!");
	PLANE_TWO_STROBE_LED_STATE = HIGH; //turn off the plane one strobe LED
	digitalWrite(plane2_strobes, PLANE_TWO_STROBE_LED_STATE && !LED_ON_N);
	TMRArd_InitTimer(PLANE_TWO_STROBE_ON_TIMER, PLANE_TWO_STROBE_ON_TIMER_INTERVAL);
	return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane Three Beacon On Timer
/////////////////////////////////////////////////

byte TestPlaneThreeBeaconOnTimerExpired(void) {
  return (byte)(TMRArd_IsTimerExpired(PLANE_THREE_BEACON_ON_TIMER));
}

byte TestPlaneThreeBeaconOnTimerActive(void) {
  return (byte)(TMRArd_IsTimerActive(PLANE_THREE_BEACON_ON_TIMER));
}

void RespPlaneThreeBeaconOnTimerExpired(void) {
  TMRArd_ClearTimerExpired(PLANE_THREE_BEACON_ON_TIMER);
  TMRArd_StopTimer(PLANE_THREE_BEACON_ON_TIMER);
  //Serial.println("Plane 3 Beacon OFF!");
  PLANE_THREE_BEACON_LED_STATE = LOW; //turn off the plane one strobe LED
  digitalWrite(plane3_beacon, PLANE_THREE_BEACON_LED_STATE && !LED_ON_N);
  //new timer strategy to fix the out of sync plane 3 strobe
  //TMRArd_InitTimer(PLANE_THREE_BEACON_OFF_TIMER, PLANE_THREE_BEACON_OFF_TIMER_INTERVAL);
  return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane Three Beacon Off Timer
/////////////////////////////////////////////////

byte TestPlaneThreeBeaconOffTimerExpired(void) {
  return (byte)(TMRArd_IsTimerExpired(PLANE_THREE_BEACON_OFF_TIMER));
}

byte TestPlaneThreeBeaconOffTimerActive(void) {
  return (byte)(TMRArd_IsTimerActive(PLANE_THREE_BEACON_OFF_TIMER));
}

void RespPlaneThreeBeaconOffTimerExpired(void) {
  TMRArd_ClearTimerExpired(PLANE_THREE_BEACON_OFF_TIMER);
  TMRArd_StopTimer(PLANE_THREE_BEACON_OFF_TIMER);
  PLANE_THREE_BEACON_LED_STATE = HIGH; //turn on the plane one strobe LED
  digitalWrite(plane3_beacon, PLANE_THREE_BEACON_LED_STATE && !LED_ON_N);
  TMRArd_InitTimer(PLANE_THREE_BEACON_ON_TIMER, PLANE_THREE_BEACON_ON_TIMER_INTERVAL);
  return;
}
/////////////////////////////////////////////////

/////////////////////////////////////////////////
// Plane Three Strobe On Timer
/////////////////////////////////////////////////

byte TestPlaneThreeStrobeOnTimerExpired(void) {
  return (byte)(TMRArd_IsTimerExpired(PLANE_THREE_STROBE_ON_TIMER));
}

byte TestPlaneThreeStrobeOnTimerActive(void) {
  return (byte)(TMRArd_IsTimerActive(PLANE_THREE_STROBE_ON_TIMER));
}

void RespPlaneThreeStrobeOnTimerExpired(void) {
  TMRArd_ClearTimerExpired(PLANE_THREE_STROBE_ON_TIMER);
  if (PLANE_THREE_STROBE_TIMER_TICKS == 3){
    TMRArd_StopTimer(PLANE_THREE_STROBE_ON_TIMER);
    PLANE_THREE_STROBE_LED_STATE = LOW; //turn off the plane three strobe LED
    digitalWrite(plane3_strobes, PLANE_THREE_STROBE_LED_STATE && !LED_ON_N);
    PLANE_THREE_STROBE_TIMER_TICKS = 0;
    TMRArd_InitTimer(PLANE_THREE_STROBE_OFF_TIMER, PLANE_THREE_STROBE_OFF_TIMER_INTERVAL);
    TMRArd_InitTimer(PLANE_THREE_BEACON_OFF_TIMER, PLANE_THREE_BEACON_OFF_TIMER_INTERVAL);
  }
  else{
    PLANE_THREE_STROBE_LED_STATE = !PLANE_THREE_STROBE_LED_STATE; //flip the plane three strobe LED
    digitalWrite(plane3_strobes, PLANE_THREE_STROBE_LED_STATE && !LED_ON_N);
    PLANE_THREE_STROBE_TIMER_TICKS++; //increse the tick count
    TMRArd_InitTimer(PLANE_THREE_STROBE_ON_TIMER, PLANE_THREE_STROBE_ON_TIMER_INTERVAL);
  }
  return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane Three Strobe Off Timer
/////////////////////////////////////////////////

byte TestPlaneThreeStrobeOffTimerExpired(void) {
  return (byte)(TMRArd_IsTimerExpired(PLANE_THREE_STROBE_OFF_TIMER));
}

byte TestPlaneThreeStrobeOffTimerActive(void) {
  return (byte)(TMRArd_IsTimerActive(PLANE_THREE_STROBE_OFF_TIMER));
}

void RespPlaneThreeStrobeOffTimerExpired(void) {
  TMRArd_ClearTimerExpired(PLANE_THREE_STROBE_OFF_TIMER);
  TMRArd_StopTimer(PLANE_THREE_STROBE_OFF_TIMER);
  PLANE_THREE_STROBE_LED_STATE = HIGH; //turn off the plane one strobe LED
  PLANE_THREE_STROBE_TIMER_TICKS = 1; //set the tick count to one, since the next time the strobe on timer expires, the the tick # will be 1.
  digitalWrite(plane3_strobes, PLANE_THREE_STROBE_LED_STATE && !LED_ON_N);
  TMRArd_InitTimer(PLANE_THREE_STROBE_ON_TIMER, PLANE_THREE_STROBE_ON_TIMER_INTERVAL);
  return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane Four Beacon On Timer
/////////////////////////////////////////////////

byte TestPlaneFourBeaconOnTimerExpired(void) {
  return (byte)(TMRArd_IsTimerExpired(PLANE_FOUR_BEACON_ON_TIMER));
}

byte TestPlaneFourBeaconOnTimerActive(void) {
  return (byte)(TMRArd_IsTimerActive(PLANE_FOUR_BEACON_ON_TIMER));
}

void RespPlaneFourBeaconOnTimerExpired(void) {
  TMRArd_ClearTimerExpired(PLANE_FOUR_BEACON_ON_TIMER);
  TMRArd_StopTimer(PLANE_FOUR_BEACON_ON_TIMER);
  PLANE_FOUR_BEACON_LED_STATE = LOW; //turn off the plane one strobe LED
  digitalWrite(plane4_beacon, PLANE_FOUR_BEACON_LED_STATE && !LED_ON_N);
  //TMRArd_InitTimer(PLANE_FOUR_BEACON_OFF_TIMER, PLANE_FOUR_BEACON_OFF_TIMER_INTERVAL);
  return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane Four Beacon Off Timer
/////////////////////////////////////////////////

byte TestPlaneFourBeaconOffTimerExpired(void) {
  return (byte)(TMRArd_IsTimerExpired(PLANE_FOUR_BEACON_OFF_TIMER));
}

byte TestPlaneFourBeaconOffTimerActive(void) {
  return (byte)(TMRArd_IsTimerActive(PLANE_FOUR_BEACON_OFF_TIMER));
}

void RespPlaneFourBeaconOffTimerExpired(void) {
  TMRArd_ClearTimerExpired(PLANE_FOUR_BEACON_OFF_TIMER);
  TMRArd_StopTimer(PLANE_FOUR_BEACON_OFF_TIMER);
  PLANE_FOUR_BEACON_LED_STATE = HIGH; //turn on the plane one strobe LED
  digitalWrite(plane4_beacon, PLANE_FOUR_BEACON_LED_STATE && !LED_ON_N);
  TMRArd_InitTimer(PLANE_FOUR_BEACON_ON_TIMER, PLANE_FOUR_BEACON_ON_TIMER_INTERVAL);
  return;
}
/////////////////////////////////////////////////

/////////////////////////////////////////////////
// Plane Four Strobe On Timer
/////////////////////////////////////////////////

byte TestPlaneFourStrobeOnTimerExpired(void) {
  return (byte)(TMRArd_IsTimerExpired(PLANE_FOUR_STROBE_ON_TIMER));
}

byte TestPlaneFourStrobeOnTimerActive(void) {
  return (byte)(TMRArd_IsTimerActive(PLANE_FOUR_STROBE_ON_TIMER));
}

void RespPlaneFourStrobeOnTimerExpired(void) {
  TMRArd_ClearTimerExpired(PLANE_FOUR_STROBE_ON_TIMER);
  TMRArd_StopTimer(PLANE_FOUR_STROBE_ON_TIMER);
  PLANE_FOUR_STROBE_LED_STATE = LOW; //turn off the plane one strobe LED
  digitalWrite(plane4_strobes, PLANE_FOUR_STROBE_LED_STATE && !LED_ON_N);
  TMRArd_InitTimer(PLANE_FOUR_STROBE_OFF_TIMER, PLANE_FOUR_STROBE_OFF_TIMER_INTERVAL);
  TMRArd_InitTimer(PLANE_FOUR_BEACON_OFF_TIMER, PLANE_FOUR_BEACON_OFF_TIMER_INTERVAL);
  return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Plane Four Strobe Off Timer
/////////////////////////////////////////////////

byte TestPlaneFourStrobeOffTimerExpired(void) {
  return (byte)(TMRArd_IsTimerExpired(PLANE_FOUR_STROBE_OFF_TIMER));
}

byte TestPlaneFourStrobeOffTimerActive(void) {
  return (byte)(TMRArd_IsTimerActive(PLANE_FOUR_STROBE_OFF_TIMER));
}

void RespPlaneFourStrobeOffTimerExpired(void) {
  TMRArd_ClearTimerExpired(PLANE_FOUR_STROBE_OFF_TIMER);
  TMRArd_StopTimer(PLANE_FOUR_STROBE_OFF_TIMER);
  //Serial.println("Plane 3 Strobe ON!");
  PLANE_FOUR_STROBE_LED_STATE = HIGH; //turn off the plane one strobe LED
  digitalWrite(plane4_strobes, PLANE_FOUR_STROBE_LED_STATE && !LED_ON_N);
  TMRArd_InitTimer(PLANE_FOUR_STROBE_ON_TIMER, PLANE_FOUR_STROBE_ON_TIMER_INTERVAL);
  return;
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Guard LED Timer Functions
/////////////////////////////////////////////////

void RespGuardLEDTimerExpired(void) {
	TMRArd_ClearTimerExpired(GUARD_LED_TIMER);
	digitalWrite(guideleds[current_guide_led], HIGH);
	current_guide_led = (current_guide_led + 1) % num_guideleds;

	if (current_guide_led != 0) {
		digitalWrite(guideleds[current_guide_led], (LOW || LED_ON_N));
		TMRArd_InitTimer(GUARD_LED_TIMER, GUARD_LED_TIMER_INTERVAL);
	}
	else {
		TMRArd_StopTimer(GUARD_LED_TIMER);
		TMRArd_StartTimer(GUARD_LED_PAUSE_TIMER);
	}
	return;
}

byte TestGuardLEDTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(GUARD_LED_TIMER));
}

byte TestGuardLEDTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(GUARD_LED_TIMER));
}
/////////////////////////////////////////////////


/////////////////////////////////////////////////
// Guard LED Pause Timer Functions
/////////////////////////////////////////////////

void RespGuardLEDPauseTimerExpired(void) {
	TMRArd_ClearTimerExpired(GUARD_LED_PAUSE_TIMER);
	TMRArd_StopTimer(GUARD_LED_PAUSE_TIMER);
	digitalWrite(guideleds[current_guide_led], (LOW || LED_ON_N));
	TMRArd_InitTimer(GUARD_LED_TIMER, GUARD_LED_TIMER_INTERVAL);
	return;
}

byte TestGuardLEDPauseTimerExpired(void) {
	return (byte)(TMRArd_IsTimerExpired(GUARD_LED_PAUSE_TIMER));
}

byte TestGuardLEDPauseTimerActive(void) {
	return (byte)(TMRArd_IsTimerActive(GUARD_LED_PAUSE_TIMER));
}
/////////////////////////////////////////////////

void updateStaticLEDs(void) {
	//static tower LEDs
	digitalWrite(towerleds[0], LOW || LED_ON_N);
	//PAPI LEDs
	digitalWrite(papileds, HIGH && !LED_ON_N);
	//the plane LEDs are active.
	digitalWrite(staticleds1, HIGH && !LED_ON_N);
	digitalWrite(staticleds2, HIGH && !LED_ON_N);
	return;
}


void RespLightSensorMeasurementReady(void){
  //Serial.println("Sensor READY!");
  AsyncAPDS9306Data lightSensorData = lightSensor.getLuminosityMeasurement();
  lightSensorRawReading = lightSensorData.raw;
  Serial.print(F("Light level: ")); Serial.println(lightSensorRawReading);
  lightSensor.startLuminosityMeasurement(); //start a new measurement
  return;
}

//initializes all the LEDs on the board.
//the LEDs are initialized off.
void initAllLEDs(void) {
	//the tower LEDs are active low drive.
	for (int i = 0; i < num_towerleds; i++) {
		pinMode(towerleds[i], OUTPUT);
		digitalWrite(towerleds[i], HIGH);
	}

	//plane 1 strobe LEDs are active drive.
	pinMode(plane1_strobes, OUTPUT);
	digitalWrite(plane1_strobes, LOW);

	//plane 1 beacon LED is active low drive.
	pinMode(plane1_beacon, OUTPUT);
	digitalWrite(plane1_beacon, HIGH);

	//plane 2 strobe LEDs are active drive.
	pinMode(plane2_strobes, OUTPUT);
	digitalWrite(plane2_strobes, LOW);

	//plane 2 beacon LED is active drive.
	pinMode(plane2_beacon, OUTPUT);
	digitalWrite(plane2_beacon, LOW);

  //plane 3 strobe LEDs are active drive.
  pinMode(plane3_strobes, OUTPUT);
  digitalWrite(plane3_strobes, LOW);

  //plane 3 beacon LED is active drive.
  pinMode(plane3_beacon, OUTPUT);
  digitalWrite(plane3_beacon, LOW);

  //plane 4 strobe LEDs are active drive.
  pinMode(plane4_strobes, OUTPUT);
  digitalWrite(plane4_strobes, LOW);

  //plane 4 beacon LED is active drive.
  pinMode(plane4_beacon, OUTPUT);
  digitalWrite(plane4_beacon, LOW);

	//the guard LEDs are active low drive.
	for (int i = 0; i < num_guideleds; i++) {
		pinMode(guideleds[i], OUTPUT);
		digitalWrite(guideleds[i], HIGH);
	}

	//PAPI LEDs are active drive.
	pinMode(papileds, OUTPUT);
	digitalWrite(papileds, LOW);

	//rest of the static LEDs are active.
	pinMode(staticleds1, OUTPUT);
	digitalWrite(staticleds1, LOW);
	pinMode(staticleds2, OUTPUT);
	digitalWrite(staticleds2, LOW);

	return;
}
