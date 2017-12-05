class Pu_lives {
  float posX ;
  float posY ;
  float velX, velY, h, w;

  void init() {
    //De loop dat de boost in een random lane terechtkomen
    posY = lanes[(int) random(lanes.length)] + 35;
    posX = random(800, width + 500);

    h = 30;
    w = 30;
    velX = -5;
  }

  void draw() {
    //Het aanmaken van alle enemies
    image(pow3, posX, posY, w, h);
    posX += velX;

    //Als de enemy voorbij de speler gaat spawned hij weer in een random lane
    if (posX < -w) {
      posY = lanes[(int) random(lanes.length)]+35;
      posX = lanes2[(int) random(lanes2.length)];
    }
    if (lives.aLives >= 5) {
      lives.aLives=5;
    }
    //Als de speler collide met de boost, dan krijgt hij +1 levenspunt
    if (!(player.posX + player.w < posX || player.posY > posY + h|| player.posY+player.h < posY)) {
      posY = lanes[(int) random(lanes.length)] + 35;
      posX = random(800, width + 500);
      lives.aLives++;

      //sound effect//
      file3.play();
    }
  }
}

void update() {
}