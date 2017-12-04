class Pu_exp {
  int numObstac = 1;
  float posX ;
  float posY;
  int velX, velY, h, w;

  void init() {
      posY= lanes[(int) random(lanes.length)] +35;
      posX = random(100, width);

    h = 30;
    w = 30;
    velX = -5;
  }

  void draw() {
    //Het aanmaken van de power-up Extra points

  image(pow4, posX, posY,w,h);
  posX += velX;

      //Als de power-up Extra points voorbij de speler gaat spawned hij weer in een random lane
      if (posX < -w) {
        posY[i] = lanes[(int) random(lanes.length)];
        posX[i] = width;
      }
      //Als de speler collide met de boost, dan krijgt hij 250 punten
      if (!(player.posX + player.w < posX || player.posY > posY + h|| player.posY+player.h < posY)) {
        punten += 250;
        posX = width;
        
        //sound effect//
          file3.play();
      }
    }
  }

  void update() {
  }
