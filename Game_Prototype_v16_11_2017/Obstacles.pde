public class Obstacles {
  float posX ;
  float posY ;
  float h, w;
  float randomLane;
  int direction;
  float velX, velY;
 

  float[] lanes2 = new float[]{800, 850, 900, 950, 1000, 1050, 1100, 1150, 1200, 1250, 1300,1350,1400,1450,1500,1550,1600};
  void init() {
    //deze loop bepaald waar de enemies terechtkomen bij de start
    for (int i = 0; i < numObstac; i++) {
      posY= lanes[(int) random(lanes.length)] + 25;
      posX= lanes2[(int) random(lanes2.length)];

      //Deze if else statements zorgen ervoor dat de objecten niet in elkaar spawnen
      if (posX <= posX + 250 && posX >= posX - 250) {
        posX= lanes2[(int) random(lanes2.length)];
      }
    }


    h = 50; //De hoogte van het object
    w = 50; // De breedte van het object
    velX = -5; //De snelheid waarmee de objecten bewegen
  }

  void draw() {
    //Hier worden de obstakels aangemaakt
     image(img2, posX[i], posY[i],w,h);
      posX += velX;


      //Als het obstakel het scherm verlaat dan spawned hij weer in een random lane
      if (posX <= -w) {
        posY = lanes[(int) random(lanes.length)];
        posX = lanes2[(int) random(lanes2.length)];
      }

      //Als de speler een obstakel raakt, verliest hij een levenspunt en verdwijnt het obstakel van het scherm.
      if (!(player.posX + player.w < posX || player.posY > posY + h|| player.posY+player.h < posY)) {
        lives.aLives--;
        posX = lanes2[(int) random(lanes2.length)];
      }
    }
  }
