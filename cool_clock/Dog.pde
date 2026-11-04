class Dog {
  int numFrames = 10;  // The number of frames in the animation
  int currentFrame = 0;

  //lerp variables - no problems here
  float x, y;
  float startX; 
  float startY;
  float endX;
  float endY;
  float timeSpan = 70000.0;
  PImage[] images = new PImage[numFrames];
  PImage deadDog;
  boolean isDead = false;


  Dog () {  //constructor
    frameRate(12);

    for (int i = 0; i < numFrames; i++) { //this loads the numbered images
      String imageName = "dog" + nf(i, 2) + ".png";
      PImage img = loadImage(imageName);
      // Resize each image individually
      img.resize(img.width/4, img.height/4);
      images[i] = img;

      x=0;
    }

    deadDog = loadImage ("deaddog.png");
    imageMode (CENTER);
    deadDog.resize (deadDog.width/16, deadDog.height/16);

    // Set startX and startY based on the resized image dimensions
    startX = x;
    startY = y; //commenting out to try something
    endX = width/7;
    endY = startY;
    startX=endX;
    if (startX >= width) {
      startX= -150;
    }
  } //constructor closer

  void drawDog () {
    float timePosition = millis()/timeSpan ; //% 1
    x = lerp(startX, endX, timePosition);
    y = lerp(startY, endY, timePosition);



    currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
    for (int xx = -30; xx < 20; xx += images[0].width) {
      image(images[currentFrame], xx, 60); // Display the current frame of the dog
    }

    // Check if the dog reaches the end position
    if (x >= endX && !isDead) {
      isDead = true; // Set the flag to indicate the dog is dead
    }
  } //drawDog closer

  void drawDeadDog () {
    if (isDead) {
      // Draw the dead dog image at the specified position
      image(deadDog, x-140, y+58);
    }
  }
}
