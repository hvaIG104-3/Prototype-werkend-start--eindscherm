public class Enemy {
  float posX ;
  float posY ;
  float velX;
  int velY, punten, h, w;

  void init() {
    //De loop dat de enemies in een random lane terechtkomen
    posY = lanes[(int) random(lanes.length)];
    posX= random(800, width + 500);

    h = 100;
    w = 50;
    velX = -3;
  }

  void draw() {
    //Het aanmaken van alle enemies
    image(img, posX, posY, w, h);
    posX += velX;

    //Als de enemy voorbij de speler gaat spawned hij weer in een random lane
    if (posX <= 0) {
      posY = lanes[(int) random(lanes.length)];
      posX = width;
    }
    //Als de speler collide met de enemy, dan wordt de enemy weggehaald uit het scherm en verliest de speler een levenspunt.
    if (player.posX + player.w >= posX && player.posY == posY) {
      lives.aLives--;
      posX = width;
      posY = lanes[(int) random(lanes.length)];

      //damage sound effect//
      file4.play();
    }
  }
}