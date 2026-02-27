#include "Robot.h"





void Robot::init(void (*serialWriteChannelFunction)(char c, int32_t v))
{
  uint8_t i;

  // Serial write channels function
  serialWriteChannel = serialWriteChannelFunction;

  // General inputs / outputs
  // - solenoid
  pinMode(kRobotSensSwitchPin, INPUT_PULLUP);
  pinMode(kRobotActSolenoidPin, OUTPUT);
  digitalWrite(kRobotActSolenoidPin, 0);

  // Encoders
  initEnc();
  updateEncodersState();

  for (i = 0; i < kNumMot; i++)
  {
    encoders[i].delta = 0;
  }

  Timer1.attachInterrupt(updateEncodersState);
  Timer1.initialize(5);  // calls every X us

  // Motors
  Timer3.initialize(20);

  for (i = 0; i < kNumMot; i++)
  {
    mot[i].init(kMotDirPin[i], kMotPwmPin[i]);
  }

  // Controllers
  for (i = 0; i < kNumMot; i++)
  {
    if (PID_enable)
      initCtrlPID(i);
    else
      initMRAC(i);
  }
}





void Robot::update(uint32_t &delta)
{
  uint8_t i;
  dt = delta;

  // Encoders
  for (i = 0; i < kNumMot; i++)
  {
    enc[i].updateTick();
  }

  updateState(enc[0].odo, enc[1].odo);

  // Controllers
  for (i = 0; i < kNumMot; i++)
  {
    if (PID_enable)
      pid[i].update(enc[i].odo * kEncImp2MotW);
    else
       mrac[i].compute(enc[i].odo * kEncImp2MotW);
  }
  tomaW=enc[1].odo *kEncImp2MotW;
  // Actuators
  for (i = 0; i < kNumMot; i++)
  {
    if (pid[i].active)
    {
      mot[i].setPWM( round( kMotV2MotPWM * pid[i].m ) );
    }
    else if(mrac[i].active)
    {
      mot[i].setPWM( round( kMotV2MotPWM * mrac[i].u ) );
    }
  }
}





void Robot::send(void)
{
  for (int idx = 0; idx < kNumMot; idx++)
  {
    (*serialWriteChannel)('g'+idx, enc[idx].tick);
  }

  (*serialWriteChannel)('k', dt);

  (*serialWriteChannel)('s', (digitalRead(kRobotSensSwitchPin) << 0));
  (*serialWriteChannel)('z', pid[0].w);
}





void Robot::stop(void)
{
  uint8_t i;

  for (i = 0; i < kNumMot; i++)
  {
    setMotorPWM(i, 0);
  }
}





void Robot::setMotorWref(uint8_t index, float new_w_r)
{
  if (PID_enable)
  {
    pid[index].enable(true);
    mrac[index].enable(false);
    pid[index].w_ref = new_w_r;
  }
  else
  {
    pid[index].enable(false);
    mrac[index].enable(true);
    mrac[index].r = new_w_r;
  }
  
  
  
}





void Robot::setMotorPWM(uint8_t index, int16_t pwm)
{
  pid[index].enable(false);
  mrac[index].enable(false);
  mot[index].setPWM(pwm);
}





void Robot::initEnc()
{
  for (int idx = 0; idx < kNumMot; idx++)
  {
    pinMode(kMotEncPin[idx][0], INPUT_PULLUP);
    pinMode(kMotEncPin[idx][1], INPUT_PULLUP);
  }
}





void Robot::initCtrlPID(uint8_t index)
{
  pid[index].active = false;
  pid[index].kp = kMotCtrlKc;

  if (kMotCtrlTi == 0)
  {
    pid[index].ki = 0;
  }
  else
  {
    pid[index].ki = kMotCtrlKc / kMotCtrlTi;
  }

  pid[index].kd = 0;
  pid[index].kf = kMotCtrlKf;
  pid[index].dt = kMotCtrlTime;

  pid[index].m_max = kMotVmax;

  pid[index].hamm_vd = 0;
  pid[index].hamm_v0 = 0;

  pid[index].reset();
}

void Robot::initMRAC(uint8_t index)
{
  mrac[index].init(kMotModelKp,kMotModelTau,kMotCtrlTime);
  pid[index].active = false;
  mrac[index].m_max = kMotVmax;

  mrac[index].hamm_vd = 0;
  mrac[index].hamm_v0 = 0;

  //pid[index].reset();
}

void Robot::updateState(uint32_t ticks_left, uint32_t ticks_right)
{

  double d1 = double(ticks_left)/kMotEncRes*2*M_PI*0.05/2;
  double d2 = double(ticks_right)/kMotEncRes*2*M_PI*0.05/2;
  double delta_d = (d2+d1)/2;
  double delta_theta = (d2-d1)/(2*wheelbase);
  x = x + delta_d*cos(theta + delta_theta/2);
  y = y + delta_d*sin(theta + delta_theta/2);
  theta = theta + delta_theta;


}
