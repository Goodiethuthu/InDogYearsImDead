// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles
// from tutorial https://processing.org/examples/simpleparticlesystem.html

class ParticleSystem {
  ArrayList<ParticleHeart> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<ParticleHeart>();
  }

  void addParticle() {
    background (0);
    translate (width/2, height/2); //making it easier to change position
    particles.add(new ParticleHeart(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      ParticleHeart p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
