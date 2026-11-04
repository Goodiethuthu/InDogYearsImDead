//using tutorial from https://openprocessing.org/sketch/16037
//I added the new font and the image of the heart

class DigitalClock extends Clock {
  int fontSize; //fields
  float x, y;
  PFont font = loadFont ("CourierStd-Bold-24.vlw"); //loading font for clock
  PImage heart = loadImage ("pixelheart.png"); //loading heart image

  DigitalClock(int _fontSize, float _x, float _y) { //constructor

    fontSize = _fontSize;
    x = _x;
    y = _y;
  }

  void getTime() { //methods
    super.getTime();
  }

  void display() {

    scale (2);
    imageMode (CENTER); //had to move alignment to center
    image(heart, 0, 0);

    textSize(fontSize);
    textAlign(CENTER);
    textFont (font);
    text (h + ":" + nf(m, 2) + ":" + nf(s, 2), 0, 0);
  }
}

class Clock {
  int h, m, s;
  Clock() {
  }

  void getTime() {
    h = hour();
    m = minute();
    s = second();
  }
}
