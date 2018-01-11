public class Obstacles {
  int numObstac = 6;
  float posX [] = new float [numObstac];
  float posY [] = new float [numObstac];
  float h, w;
  float randomLane;
  int direction;
  float velX, velY;
  int punten = 0;



  float[] lanes2 = new float[]{800, 850, 900, 950, 1000, 1050, 1100, 1150, 1200, 1250, 1300};
  void init() {
    //deze loop bepaald waar de enemies terechtkomen bij de start
    for (int i = 0; i < numObstac; i++) {
      posY[i] = lanes[(int) random(lanes.length)];
      posX[i] = lanes2[(int) random(lanes2.length)];

      //Deze if else statements zorgen ervoor dat de objecten niet in elkaar spawnen
      if (posX[i] <= posX[i] + 250 && posX[i] >= posX[i] - 250) {
        posX[i]= lanes2[(int) random(lanes2.length)];
      }
    }


    h = 50; //De hoogte van het object
    w = 50; // De breedte van het object
    velX = -5; //De snelheid waarmee de objecten bewegen
  }

  void draw() {
    //Hier worden de obstakels aangemaakt
    for (int i = 0; i < numObstac; i++) {
   //   fill(0, 0, 255);//
   //   rect(posX[i], posY[i], w, h);//
     image(img2, posX[i], posY[i],w,h);
      posX[i] += velX;



      //for (int j = i; j < numObstac; j++) 
      //{
      //if (posX[i] <= posX[j] + w &&
      //    posX[i] >= posX[j] - w && 
      //    posY[i] == posY[j])  
      // {
      //     posY[j] = lanes[(int) random(lanes.length)];

      // }
      //  }









      //Als het obstakel het scherm verlaat dan spawned hij weer in een random lane
      if (posX[i] <= 0) {
        posY[i] = lanes[(int) random(lanes.length)];
        posX[i] = width;
      }

      //Als de speler een obstakel raakt, verliest hij een levenspunt en verdwijnt het obstakel van het scherm.
      if (player.posX + player.w >= posX[i] && player.posY == posY[i]) {
        lives.aLives--;
        posX[i] = lanes2[(int) random(lanes2.length)];
      }
    }
  }

  void update() {
  }
}
