class Flower {
  PImage flower; // Declare PImage variable for the flower image
  PVector[] flowerPositions;

  Flower() {
    // Load the flower image
    flower = loadImage("flower.png");
    flower.resize(flower.width/4, flower.height/4); //Make flower smaller

    flowerPositions = new PVector[24]; // Assuming maximum 24 hours
    generateRandomPositions();
  }
  void generateRandomPositions() {
    for (int i = 0; i < flowerPositions.length; i++) {
      flowerPositions[i] = new PVector(random(width), random(height / 2 - flower.height));
    }
  }
  void showFlowers() {
    // Get the current hour
    int currentHour = hour();

    // Display flowers based on the current hour
    for (int i = 0; i < currentHour; i++) {
      image(flower, flowerPositions[i].x, flowerPositions[i].y); // Display a flower at each hour
    }
  }
}
