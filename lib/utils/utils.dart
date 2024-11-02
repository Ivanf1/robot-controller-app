int mapJoystickValueToMotorSpeed(double value, int lastValue) {
  if (value == 0) {
    return lastValue >= 1024 ? 1024 : 0;
  }
  if (value < 0) {
    return ((-value) * 1023).round();
  } else {
    return ((value * 1023) + 1024).round();
  }
}
