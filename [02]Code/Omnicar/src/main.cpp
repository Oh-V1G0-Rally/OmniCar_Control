#include <Arduino.h>
#include <channels.h>
#include "Adafruit_MotorShield.h"
#include "robot_config.h"
#include "Robot.h"

/******************************************************************************
 * GLOBAL VARIABLES
 ******************************************************************************/
Adafruit_MotorShield AFMS = Adafruit_MotorShield();

unsigned long current_micros = 0, previous_micros = 0;
unsigned long last_motor_update_millis = 0;
bool timeout = false;
channels_t serial_channels;
//uint8_t builtin_led_state;

Robot robot;
Encoder *encoders = robot.enc;


/******************************************************************************
 * FUNCTIONS HEADERS
 ******************************************************************************/
void processSerialPacket(char channel, uint32_t value, channels_t& obj);
void serialWrite(uint8_t b);
void serialWriteChannel(char channel, int32_t value);
void serialRead();
void checkMotorsTimeout();

// // Callback per il debug seriale richiesta da Robot::init
// void onSerialWrite(char c, int32_t v) {
//   // Opzionale: stampa messaggi di debug interni del robot se necessario
// }

void setup() {
  // Inizializza la seriale per il monitoraggio
  Serial.begin(115200);
  //while (!Serial) delay(10); // Attendi l'apertura del monitor seriale
  
  // Delay to stabilize power and allow serial monitor to connect
  delay(2000);

  Serial.println("--- OMNICAR MOTOR TEST START ---");
  Serial.println("Initializing robot hardware...");
  Serial.flush(); // Ensure message is sent before robot.init() potentially crashes

  // Inizializza il robot passando la funzione di callback per la seriale
  robot.init(serialWriteChannel);

  Serial.println("Robot initialized.");
  Serial.println("Starting sequence: (Forward/Backward)");
  Serial.println("WARNING: Ensure wheels are free to move!");
  delay(2000); // Pausa di sicurezza prima di partire
}

void loop() {
  const int PWM_test = 2048; // 50% duty cycle (2048/4095)

  for (int i = 0; i < kNumMot; i++) {
    // --- AVANTI ---
    // setMotorPWM gestisce automaticamente il pin DIR: PWM positivo -> Avanti
    Serial.printf("Motor %d: FORWARD (+%d)\n", i, PWM_test);
    robot.setMotorPWM(i, PWM_test); 
    delay(2000); 

    // --- STOP ---
    robot.setMotorPWM(i, 0);
    delay(1000);

    // --- INDIETRO ---
    // Passando un valore negativo, la classe Motor inverte automaticamente il pin DIR
    Serial.printf("Motor %d: BACKWARD (-%d)\n", i, PWM_test);
    robot.setMotorPWM(i, -PWM_test); 
    delay(2000);

    // --- STOP ---
    robot.setMotorPWM(i, 0);
    delay(1000);
  }

  Serial.println("Full sequence complete. Restarting in 2 seconds...");
  delay(2000);
}


/******************************************************************************
 * FUNCTIONS IMPLEMENTATIONS
 ******************************************************************************/
void processSerialPacket(char channel, uint32_t value, channels_t& obj) {
  uint8_t mot_i;
  int16_t pwm;

  // Reset watchdog
  if ((channel == 'G') || (channel == 'K')) {
    last_motor_update_millis = millis();
  }

  // Process incomming serial packet
  switch (channel) {
    // - reference angular speed
    case 'G':
    case 'H':
    case 'I':
    case 'J':
      mot_i = channel - 'G';
      // set reference angular speed for the motors
#ifdef CONFIG_LAZARUS
      robot.setMotorWref(mot_i, ((int32_t) value) * kEncImp2MotW );
#endif
#ifdef CONFIG_ROS
      robot.setMotorWref(mot_i, *((float*) &value) );
#endif
      break;
  
    // - PWM
    case 'K':
      mot_i = (value >> 24) & 0x03;
      pwm = value & 0xFFFF;
      robot.setMotorPWM(mot_i, pwm);
      break;

    // - solenoid
    case 'L':
      //digitalWrite(kRobotActSolenoidPin, value);
      break;
  }
}

void serialWrite(uint8_t b) {
  Serial.write(b);
}

void serialWriteChannel(char channel, int32_t value) {
  serial_channels.send(channel, value);
}

void serialRead() {
  uint8_t serial_byte;

  if (Serial.available() > 0) {
    serial_byte = Serial.read();
    serial_channels.StateMachine(serial_byte);
  }
}

void checkMotorsTimeout() {
  if (millis() - last_motor_update_millis > kMotCtrlTimeout) {
    timeout = true;

    robot.stop();
    // digitalWrite(kRobotActSolenoidPin, 0);

    /*builtin_led_state = LOW;
    digitalWrite(LED_BUILTIN, builtin_led_state);*/

  } else {
    if (timeout) {
      robot.init(serialWriteChannel);
    }

    timeout = 0;
  }
}
