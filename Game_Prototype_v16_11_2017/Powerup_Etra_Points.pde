class Pu_exp {
  int numObstac = 1;
  float posX [] = new float [numObstac];
  float posY [] = new float [numObstac];
  int velX, velY, h, w;

  void init() {
    //De loop dat de boost in een random lane terechtkomen
    for (int i = 0; i < numObstac; i++) {
      posY[i] = lanes[(int) random(lanes.length)];
      posX[i] = random(100, width);
    }

    h = 30;
    w = 30;
    velX = -5;
  }

  void draw() {
    //Het aanmaken van de power-up Extra points
    for (int i = 0; i < numObstac; i++) {
    //fill(0,255,255);
  //rect(posX[i], posY[i],w,h);
  image(pow4, posX[i], posY[i],w,h);
  posX[i] += velX;

      //Als de power-up Extra points voorbij de speler gaat spawned hij weer in een random lane
      if (posX[i] < 0) {
        posY[i] = lanes[(int) random(lanes.length)];
        posX[i] = width;
      }
      //Als de speler collide met de boost, dan krijgt hij 250 punten
      if (player.posX + player.w == posX[i] && player.posX <= posX[i] + w && player.posY == posY[i]) {
        punten += 250;
        posX[i] = width;
        
        //sound effect//
          file3.play();
      }
    }
  }

  void update() {
  }
}
