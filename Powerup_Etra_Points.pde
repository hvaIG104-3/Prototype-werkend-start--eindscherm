class Pu_exp {
  float posX ;
  float posY;
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
    //Het aanmaken van de power-up Extra points
    image(pow4, posX, posY, w, h);
    posX += velX;

    //Als de power-up Extra points voorbij de speler gaat spawned hij weer in een random lane
    if (posX < -w) {
      posY = lanes[(int) random(lanes.length)] + 35;
      posX = lanes2[(int) random(lanes2.length)];
    }
    //Als de speler collide met de boost, dan krijgt hij 250 punten
    if (!(player.posX + player.w < posX || player.posY > posY + h|| player.posY+player.h < posY)) {
      punten += 250;
      posX = random(800, width + 500);
      posY = lanes[(int) random(lanes.length)] + 35;

      //sound effect//
      file3.play();
    }
  }
}