class Pu_lives {
  int numObstac = 1;
  float posX [] = new float [numObstac];
  float posY [] = new float [numObstac];
  int velX, velY, h, w;

  void init() {
    //De loop dat de boost in een random lane terechtkomen
    for (int i = 0; i < numObstac; i++) {
      posY[i] = lanes[(int) random(lanes.length)];
      posX[i] = random(800, width + 500);
    }

    h = 30;
    w = 30;
    velX = -5;
  }

  void draw() {
    //Het aanmaken van alle enemies
    for (int i = 0; i < numObstac; i++) {
 //   fill(255,0,0);
 // rect(posX[i], posY[i],w,h);
      image(pow3, posX[i], posY[i],w,h);
  posX[i] += velX;

      //Als de enemy voorbij de speler gaat spawned hij weer in een random lane
      if (posX[i] < 0) {
        posY[i] = lanes[(int) random(lanes.length)];
        posX[i] = width;
      }
      //Als de speler collide met de boost, dan krijgt hij +1 levenspunt
      if (player.posX + player.w == posX[i] && player.posX <= posX[i] + w && player.posY == posY[i] && lives.aLives != 5) {
        posX[i] = width;
        lives.aLives++;
        
        //sound effect//
          file3.play();
      }
    }
  }

  void update() {
  }
}
