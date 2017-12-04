class Pu_slow {
  float posX ;
  float posY;
  int velX, velY, h, w;
  int t = 0;

  void init() {
    //De loop dat de boost in een random lane terechtkomen
      posY = lanes[(int) random(lanes.length)] + 35;
      posX = random(100, width);

    h = 30;
    w = 30;
    velX = -5;
  }

  void draw() {
    //Het aanmaken van alle enemies
    image(pow2, posX, posY,w,h);
  posX += velX;

      //Als de enemy voorbij de speler gaat spawned hij weer in een random lane
      if (posX < -w ) {
        posY = lanes[(int) random(lanes.length)] + 35;
        posX = width;
      }
      //Als de speler collide met de boost, dan vertraagt de tijd
      if (!(player.posX + player.w < posX || player.posY > posY + h|| player.posY+player.h < posY)) {
        for(int i=0;i<100;i++){
        obstacle1[i].velX = -2.5;}
        enemies.velX = -1.5;
        
        //sound effect//
          file3.play();
      }
    t++;
    if (t > 300) {
for(int i=0; i < numObjectBegin;i++){
      obstacle1[i].velX = -5;}
      enemies.velX = -2.5;
      t=0;
    }
  }

  void update() {
  }
}
