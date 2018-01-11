class Pu_slow {
  float posX;
  float posY;
  float velX, velY, h, w;
  int t = 0;

  void init() {
    //De loop dat de boost in een random lane terechtkomen
    posY = lanes[(int) random(lanes.length)] +35;
    posX = random(800, width + 500);

    h = 30;
    w = 30;
    velX = -5;
  }

  void draw() {
    //Het aanmaken van alle enemies
    image(pow2, posX, posY, w, h);
    posX += velX;

    //Als de enemy voorbij de speler gaat spawned hij weer in een random lane
    if (posX <-w ) {
      posY = lanes[(int) random(lanes.length)] +35;
      posX = random(800, width + 500);
    }
    //Als de speler collide met de boost, dan vertraagt de tijd
    if (!(pPosX + player.w < posX || pPosY > posY + h|| pPosY+player.h < posY)) {
      for (int i=0; i<25; i++) {
        obstacle1[i].velX = -3.5;
      }
      enemies.velX = -1.5;
      velX = -2.5;
      exp.velX = -2.5;
      livespu.velX = -2.5;

      //sound effect//
      file3.play();
      posX = random(800, width + 500);
      posY = lanes[(int) random(lanes.length)] +35;
    }
    t++;
    if (t > 300) {
      for (int i=0; i < 25; i++) {
        obstacle1[i].velX = -5;
      }
      enemies.velX = -2.5;
      velX = -5;
      exp.velX = -5;
      livespu.velX = -5;
      t=0;
    }
  }
}