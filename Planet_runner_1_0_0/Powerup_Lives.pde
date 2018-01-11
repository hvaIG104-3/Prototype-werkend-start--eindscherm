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
    //Als de speler collide met de boost, dan krijgt hij +1 levenspunt
    if (!(pPosX + player.w < posX || pPosY > posY + h || pPosY+player.h < posY)) {
      posY = lanes[(int) random(lanes.length)] + 35;
      posX = random(800, width + 500);
      //maximale levens = 5
      if (lives.aLives < 5) {
        lives.aLives++;
      }

      //sound effect//
      soundLives.play();
    }
  }
}