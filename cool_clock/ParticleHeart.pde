// A simple Particle class
// from this tutorial:https://processing.org/examples/simpleparticlesystem.html
//trying to change to have hearts appear and cascade down NOT WORKING

class ParticleHeart {
  PVector position; //fields
  PVector velocity;
  PVector acceleration;
  float lifespan;
  PImage heart = loadImage ("pixelheart.png"); //loading heart image, I added this

  ParticleHeart(PVector l) { //constructor
    background (137, 205, 255);
    scale (.5);
    acceleration = new PVector(0, 0.25);
    velocity = new PVector(random(-10, 10), random(-15, 0)); //played with this to make them more explosive
    position = l.copy();
    lifespan = 180.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {

    image(heart, position.x, position.y); //I added this
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
