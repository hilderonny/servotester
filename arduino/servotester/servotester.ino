// See https://www.instructables.com/id/Use-your-Adafruit-rgb-lcd-Pi-Plate-for-Raspberry-P/
#include <Adafruit_RGBLCDShield.h>
#include <Servo.h>

Adafruit_RGBLCDShield lcd = Adafruit_RGBLCDShield();
Servo servo;

#define WHITE 0x7
uint8_t rotation = 90;
uint8_t pressedButtons = 0;

void setup() {
  servo.attach(7);
  lcd.begin(16, 2); // 16 columns, 2 rows
  lcd.setBacklight(WHITE);
  servo.write(rotation);
  updateDisplay();
}

void updateDisplay() {
  // Servoposition auslesen
  int degrees = servo.read();
  int microSeconds = servo.readMicroseconds();
  String line1 = String(degrees) + " degrees";
  lcd.setCursor(0, 0);
  lcd.print(line1);
  String line2 = String(microSeconds) + " microsecs";
  lcd.setCursor(0, 1);
  lcd.print(line2);
}

void loop() {
  uint8_t buttons = lcd.readButtons();
  if (buttons) {
    pressedButtons = buttons;
  } else if (pressedButtons) {
    // Erst beim Loslassen
    if (pressedButtons & BUTTON_UP) {
      if (rotation <= 170) rotation += 10;
    }
    if (pressedButtons & BUTTON_DOWN) {
      if (rotation >= 10) rotation -= 10;
    }
    if (pressedButtons & BUTTON_RIGHT) {
      if (rotation <= 179) rotation += 1;
    }
    if (pressedButtons & BUTTON_LEFT) {
      if (rotation >= 1) rotation -= 1;
    }
    if (pressedButtons & BUTTON_SELECT) {
      rotation = 90;
    }
    servo.write(rotation);
    lcd.clear();
    updateDisplay();
    pressedButtons = 0;
  }
}
