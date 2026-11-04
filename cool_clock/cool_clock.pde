//Lauren Thu IAT 806 FEB 2024
//Cool Clock Project

//IN DOG YEARS IM DEAD

//This clock is a reminder of the short time we have
//with our pets, and how those moments when we have
//them in our lives are precious. The person crosses
//the screen every minute (60 sec) whereas the dog
//crosses the screen every 70 seconds. An hour is represented
//by the person dying (not yet added), and every 7 seconds is represented by
//the dog dying. For each hour and minute, a flower or
//bone appears on the screen respectively, so you can count them to see
//what time it is. If you press the mouse, the
//screen turns to colour and the time is displayed.
// I would like to add that the man and the dog cross the canvas
//at different rates, and then when they meet at the same place, 
//the colour time would appear - this would replace the mousePressed function

int offsetY = -20;


DigitalClock digitalClock;
ParticleSystem ps;
Flower flower;
Bone bone;
Man man;
Dog dog;



void setup () {
  background (169);
  size (720, 340);

  digitalClock = new DigitalClock(40, 0, 0); //variable for the digital clock class
  ps = new ParticleSystem(new PVector(-10, 10)); //position can move here
  flower = new Flower ();
  bone = new Bone ();
  man = new Man ();
  dog = new Dog ();
}

void draw () {


  background (169);
  strokeWeight (3);
  line (0, height/2-offsetY, width, height/2-offsetY); //land

  pushMatrix ();

  flower.showFlowers ();
  bone.showBones ();
  man.drawMan();

  if (second() % 7 == 0)
    dog.drawDeadDog ();
  else
    dog.drawDog();
  popMatrix ();
  //if(dog.x == man.x)) {

  //   } - want to add this to below, but need them to be at different speeds first



  if (mousePressed) { //for now, this is mouse pressed, but change to when the two meet

    ps.addParticle(); //call particle system method
    ps.run();


    digitalClock.getTime(); //call clock class method
    digitalClock.display();
  }
}
