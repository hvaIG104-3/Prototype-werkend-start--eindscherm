class Bullet {

  float posX, posY;
  float velX;
  float diameter;
  boolean isFired;
  int ammo;
  int timer;

  //ammobar
  float ammobarh = 15;
  float ammobarw = 125;
  float ammobarposX = 15;
  float ammobarposY = 90;
  
  PImage schiet;
  PImage schietController;

  void init() {
    posX = -1000;
    posY = -1000;
    velX =0;
    diameter = 40;
    isFired = false;
    ammo =0;
    timer = 0;
    schiet = loadImage("Images/schiet.png");
    schietController = loadImage("Images/schietController.png");
  }

  void update() {
    if (isFired) {
      if (posX > width) {
        init();
      }
      posX += velX;
    }
        //ammobar
    image(plasmabolt, 150, 83, 30, 30);
    //Ammo Display
    fill(0, 0, 0);
    stroke(255, 255, 255);
    rect(14, 89, 126, 16);
    noStroke();
    fill(0, 0, 255);
    rect(ammobarposX, ammobarposY, timer, ammobarh);

      timer++;
      if (timer >= 125) {
        ammo++;
        timer = 125;
        fill(255);
        textSize(25);        
        if (cont != null){
        image(schietController, 195, 85, 165, 32);
        } else {
          image(schiet, 195, 85, 165, 32);
        }
      }
      if (ammo >1) {
        ammo =1;
      }
    


  }
  void draw() {
    fill(255);
    // ellipse(posX,posY,diameter,diameter);
    image(plasmabolt, posX, posY-25, diameter, diameter);
  }

  void fire() {
    if (ammo > 0) {
      isFired = true;
      posX = pPosX + 25;
      posY = pPosY + 50;
      velX = 10;
      ammo--;
    }
  }
} 