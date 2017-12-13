class Button {
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  int c = 0;
  color hov;
  color unhov;
  boolean hover;
  PImage image;
  PImage image2;

  Button(PImage images, float xpos, float ypos, float widthB, float heightB, PImage images2) {
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    image2 = images2;
    image = images;
  }

  void Draw() {
    if (overCircle(int(x), int(y), 30)) {
      image(image2, x, y);
    } else {
      image(image, x, y);
    }


    //text(label, x + (w / 2), y + (h / 2));
  }
  boolean mouseHover() {
    if (overCircle(int(x), int(y), 30)) {
      return true;
    }
    return false;
  }

  boolean MouseIsOver() {
    if (overCircle(int(x), int(y), 30)) {
      hover = true;
      if (mousePressed) {

        return true;
      }
    } else {
      hover = false;
    }
    return false;
  }
}
class switchButtons {
  float x;
  float y;
  float w;
  float h;
  PImage image2;
  PImage image;
  PImage image3;
  PImage image4;

  boolean button = false;
  switchButtons(PImage images, PImage images2, float xpos, float ypos, float widthB, float heightB, PImage images3, PImage images4) {
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    image = images;
    image2 = images2;
    image3 = images3;
    image4 = images4;
  }

  void Draw() {
    if (button) {
      if (overCircle(int(x), int(y), int(w))) {
        image(image4, x, y);
      } else {
        image(image3, x, y);
      }
    } else {
      if (overCircle(int(x), int(y), int(w))) {
        image(image2, x, y);
      } else {
        image(image, x, y);
      }
    }
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}