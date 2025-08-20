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
  lcd.print(rotation);
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
    lcd.print(rotation);
    pressedButtons = 0;
  }
}
