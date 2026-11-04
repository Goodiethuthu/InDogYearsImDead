class Bone {
  PImage bone; // Declare PImage variable for the bone image
  PVector[] bonePositions; //this is so the bones don't bounce around

  Bone() {
    // Load the flower image
    bone = loadImage("bone.png");
    bone.resize(bone.width/4, bone.height/4); //Make flower smaller
    imageMode (CENTER);

    bonePositions = new PVector[60]; // Assuming maximum 60 minutes
    generateRandomBonePositions();
  }
  void generateRandomBonePositions() {
    for (int i = 0; i < bonePositions.length; i++) {
      bonePositions[i] = new PVector(random(width), random(height / 2 +50, height));
    }
  }
  void showBones() {
    // Get the current minute
    int currentMinute = minute();

    // Display bones based on the current minute
    for (int i = 0; i < currentMinute; i++) {
      image(bone, bonePositions[i].x, bonePositions[i].y); // Display a flower at each hour
    }
  }
}
