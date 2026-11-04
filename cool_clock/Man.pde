class Man {
  int numFrames = 10;  // The number of frames in the animation
  int currentFrame = 0;

  //lerp variables - no problems here
  float x, y;
  float startXm = 0; //because the image position is offset from center
  float startY;
  float endXm;
  float endY;
  float timeSpan = 60000.0;
  PImage[] images = new PImage[numFrames];

  Man () {  //constructor
    frameRate(10);

    for (int i = 0; i < numFrames; i++) { //this loads the numbered images
      String imageName = "man" + nf(i, 2) + ".png";
      PImage img = loadImage(imageName);
      // Resize each image individually
      img.resize(img.width/4, img.height/4);
      images[i] = img;
    }
    // Set startY and endX based on the resized image dimensions
    startY = height/2 - images[0].height/2;
    endXm = width; // - images[0].width/2
    endY = startY;
  } //constructor closer

  void drawMan () {
    float timePosition = millis()/timeSpan % 1;
    x = lerp(startXm, endXm, timePosition);
    y = lerp(startY, endY, timePosition);

    translate(x, y);

    currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
    for (int xx = -30; xx < 20; xx += images[0].width) {
      image(images[currentFrame], xx, 20); // Display the current frame of the man
    }
  } //drawMan closer
  
  void resetPosition() {
    startXm = 0;
    startY = height/2 - images[0].height/2;
    endXm = width;
    endY = startY;
  }
} //class closer
