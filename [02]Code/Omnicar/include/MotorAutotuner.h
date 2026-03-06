#ifndef MOTOR_AUTOTUNER_H
#define MOTOR_AUTOTUNER_H

#include <Arduino.h>
#include "Robot.h"
#include "robot_config.h"

class MotorAutotuner {
public:
    enum State {
        INIT,
        PREHEAT,
        PAUSE,
        STEP1,
        STEP2,
        FINISHED
    };

    MotorAutotuner(Robot* robotRef) : robot(robotRef), state(INIT) {}

    // Avvia la sequenza di tuning
    void start(int motorIndex, int pwmValue) {
        if (motorIndex < 0 || motorIndex >= kNumMot) return;
        targetMotor = motorIndex;
        targetPWM = pwmValue;
        state = PREHEAT;
        stateStartTime = millis();
        lastUpdateMicros = micros();
        
        Serial.printf("--- START Test Tuning Motor %d, PWM %d ---\n", targetMotor, targetPWM);
        Serial.println("State: PREHEAT (Riscaldamento: Motore a PWM target per 2s...)");
        
        // Applica il PWM una volta sola all'inizio
        robot->setMotorPWM(targetMotor, targetPWM);
    }

    // Ferma forzatamente il tuning e resetta lo stato
    void stop() {
        robot->setMotorPWM(targetMotor, 0);
        state = INIT;
        Serial.println("\n--- TUNING ABORTED BY USER ---");
    }

    // Metodo non-blocking da chiamare nel loop
    void update() {
        unsigned long currentMillis = millis();
        unsigned long currentMicros = micros();
        
        switch (state) {
            case INIT:
                // In attesa
                break;

            case PREHEAT:
                if (currentMillis - stateStartTime > 2000) {
                    state = PAUSE;
                    stateStartTime = currentMillis;
                    
                    // Ferma il motore per la pausa
                    robot->setMotorPWM(targetMotor, 0);
                    Serial.println("PREHEAT Finito. Inizio PAUSA (1s)...");
                }
                break;

            case PAUSE:
                if (currentMillis - stateStartTime > 1000) {
                    state = STEP1;
                    stateStartTime = currentMillis; // Reset tempo a 0 per il grafico
                    lastUpdateMicros = currentMicros;
                    
                    // --- FIX: RESET REALE DEGLI ENCODER ---
                    uint32_t dummy_dt = 0;
                    robot->update(dummy_dt);
                    
                    // Applica PWM per STEP 1 (una volta sola)
                    robot->setMotorPWM(targetMotor, targetPWM / 2);

                    Serial.println("PAUSA Finita.");
                    Serial.println("State: TEST START (Step 1: 50% -> Step 2: 100%)");
                    // Intestazione CSV per lo script Python
                    Serial.println("Time_ms,PWM_Ref,Speed_rad_s"); 
                }
                break;

            case STEP1:
                // Log dati a 200Hz
                runControlLoop(currentMillis, currentMicros, targetPWM / 2);

                // Dopo 2 secondi passa allo Step 2
                if (currentMillis - stateStartTime > 2000) {
                    state = STEP2;
                    // NON resettiamo stateStartTime, così il tempo prosegue lineare nel CSV
                    
                    // Applica PWM per STEP 2 (una volta sola)
                    robot->setMotorPWM(targetMotor, targetPWM);
                }
                break;

            case STEP2:
                // Log dati a 200Hz
                runControlLoop(currentMillis, currentMicros, targetPWM);

                // Fine dopo altri 2 secondi (totale 4s di test)
                if (currentMillis - stateStartTime > 4000) {
                    state = FINISHED;
                    robot->setMotorPWM(targetMotor, 0);
                    Serial.println("State: FINISHED");
                }
                break;

            case FINISHED:
                robot->setMotorPWM(targetMotor, 0);
                state = INIT; // Reset automatico
                break;
        }
    }

    bool isRunning() { return state != INIT; }

private:
    // Helper per leggere encoder e stampare seriale alla frequenza corretta
    void runControlLoop(unsigned long currentMillis, unsigned long currentMicros, int currentPWM) {
        // Usa kMotCtrlTimeUs (5000us = 200Hz) definito in robot_config.h
        if (currentMicros - lastUpdateMicros >= kMotCtrlTimeUs) { //kMotCtrlTimeUs= 0.005s = 200Hz
            uint32_t dt_us = currentMicros - lastUpdateMicros;
            float dt_sec = dt_us / 1000000.0f;

            robot->update(dt_us); 

            // Calcolo velocità
            float ticks = (float)robot->enc[targetMotor].odo; 
            float speed_rad_s = ticks * kEncImp2MotW; // Conversione da ticks a rad/s

            // Log: Tempo relativo all'inizio del TEST (Step 1)
            Serial.printf("%lu,%d,%.4f\n", currentMillis - stateStartTime, currentPWM, speed_rad_s);

            lastUpdateMicros = currentMicros;
        }
    }

    Robot* robot;
    State state;
    int targetMotor;
    int targetPWM;
    unsigned long stateStartTime;
    unsigned long lastUpdateMicros;
};

#endif
