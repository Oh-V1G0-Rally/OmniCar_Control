#ifndef ROBOTCONFIG_H
#define ROBOTCONFIG_H

#include <Arduino.h>

#ifndef PI
#define PI 3.14159265358979323846f
#endif

/******************************************************************************
 * Configuration Mode
 ******************************************************************************/
#define CONFIG_ROS            //!< Firmware communicates via ROS2/Serial

/******************************************************************************
 * Robot Geometry & Kinematics (Omnidirectional 4WD)
 ******************************************************************************/
constexpr int kNumMot = 4;
const float kRobotL[] = { 
  0.185,    //!< d_x: front-back wheel distance / 2 (m)
  0.220     //!< d_y: left-right wheel distance / 2 (m)
};

const float kRobotWhD[] = { 0.060, 0.060, 0.060, 0.060 }; //!< Wheel diameters (m)
const float kRobotBattVnom = 11.1f;                       //!< Battery 3S1P

/******************************************************************************
 * Pinout Mapping - OMNICAR ESP32
 ******************************************************************************/

// --- MOTORS (PWM & DIRECTION) ---
// Utilizziamo l'API LEDC di ESP32 per PWM ad alta risoluzione
const uint8_t kMotPWMPin[] = { 13, 14, 26, 33 }; // FL, FR, RL, RR
const uint8_t kMotDirPin[] = { 12, 27, 25, 32 }; // FL, FR, RL, RR
const uint8_t kMotPWMCh[]  = { 0, 1, 2, 3 };     // Canali LEDC indipendenti

// --- ENCODERS ---
// Nota: 34, 35, 36, 39 richiedono pull-up esterni!
const uint8_t kMotEncPinA[] = { 34, 36, 18, 21 }; // FL, FR, RL, RR
const uint8_t kMotEncPinB[] = { 35, 39, 19, 22 }; // FL, FR, RL, RR

// --- PERIPHERALS ---
//const uint8_t kI2C_SDA = 21; // Attenzione: condiviso con Encoder RR A se non rimappato
//const uint8_t kI2C_SCL = 22; // Attenzione: condiviso con Encoder RR B se non rimappato

/******************************************************************************
 * Motor & Control Parameters
 ******************************************************************************/
const float kMotNgear  = 18.75;      //!< Gear reduction ratio
// #TOCHECK 
const float kMotEncRes = 64.0f * 4.0f; //!< Quad pulses per revolution

// PWM Parametrization (ESP32 Specific)
constexpr uint32_t kMotPWMFreq = 20000; //!< 20kHz per evitare ronzio udibile
constexpr uint8_t kMotPWMRes   = 10;    //!< 10 bit resolution (0-1023)
constexpr int32_t kMotPWMMax   = (1 << kMotPWMRes) - 1;

// Low Level Controller (Timing)
const unsigned long kMotCtrlFreq = 50UL;               //!< Loop a 50Hz (minimo ROS)
const float kMotCtrlTime = 1.0f / kMotCtrlFreq;
const unsigned long kMotCtrlTimeUs = 1000000UL / kMotCtrlFreq;
const unsigned long kMotCtrlTimeout = 100UL;           //!< Watchdog (ms)
const bool kMotCtrlTimeoutEnable = true;

const unsigned long kMotCtrlLEDOkFreq = 4UL;  //!< heartbeat LED frequency (Hz)
const unsigned long kMotCtrlLEDOkCount = 1000000UL / kMotCtrlLEDOkFreq / kMotCtrlTimeUs / 2;

// Motor Model (from previous Arduino calibration)
const float kMotModelKp  = 4.5000f;  //!< Gain (rad.s^-1 / V)
const float kMotModelTau = 0.1000f;  //!< Time constant (s)
const float kMotModelLag = 0.0000;   //!< lag lag (s)
const float kMotVmax     = 11.1f;    //!< Max battery voltage

// PI Gains (Derived via IMC Tuning) 
const float kMotCtrlTauCl = kMotModelTau / 1.0f;                            //IMC desired time constant for the closed-loop (s))
const float kMotCtrlKcKp = kMotModelTau / (kMotCtrlTauCl + kMotModelLag);   //IMC tunning: Kc_PI * Kp_plant
const float kMotCtrlKc    = (kMotModelTau / kMotCtrlTauCl) / kMotModelKp;   //PI proportional gain (V / rad.s^(-1))
const float kMotCtrlTi    = kMotModelTau;                                   //PI integration time (s)
const float kMotCtrlKf    = 1.0f / kMotModelKp;                             // Feed-Forward gain

/******************************************************************************
 * Conversion Constants
 ******************************************************************************/
// Ticks to Motor Angular Speed (rad/s)
const float kEncImp2MotW = (2.0f * PI * 1000000.0f) / (kMotCtrlTimeUs * kMotNgear * kMotEncRes);

// Volts to PWM (0..1023)
const float kMotV2MotPWM = kMotPWMMax * 1.0 / kRobotBattVnom;

#endif
