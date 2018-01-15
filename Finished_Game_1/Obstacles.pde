public class Obstacles {
  float posX;
  float posY; 
  float h, w;
  float randomLane;
  int direction;
  float velX, velY;


  void init() {
    //deze loop bepaald waar de enemies terechtkomen bij de start
    posY = lanes[(int) random(lanes.length)] +25;
    posX = lanes2[(int) random(lanes2.length)];

    //Deze if statement zorgen ervoor dat de objecten niet in elkaar spawnen
    if (!(posX + w < posX || posY > posY + h|| posY+h < posY || posX > posX +w)) {
      posX= lanes2[(int) random(lanes2.length)];
    }


    h = 48; //De hoogte van het object
    w = 48; // De breedte van het object

    velX = -8; //De snelheid waarmee de objecten bewegen
  }

  void draw() {
    //Hier worden de obstakels aangemaakt
    image(imgObstacle, posX, posY, w, h);
    posX += velX;

    //Als het obstakel het scherm verlaat dan spawned hij weer in een random lane
    if (posX <= -w) {
      posY = lanes[(int) random(lanes.length)] + 25;
      posX = 300 + lanes2[(int) random(lanes2.length)];
    }

    //Als de speler een obstakel raakt, verliest hij een levenspunt en verdwijnt het obstakel van het scherm.
    if (!(pPosX + player.w < posX || pPosY > posY + h|| pPosY+player.h < posY|| posX +w< pPosX)) {
      lives.aLives--;
      posX = lanes2[(int) random(lanes2.length)];
      posY = lanes[(int) random(lanes.length)] +25;
      for (int i=0; i< 25; i++) {
        colissionsObstacle.emit(1);
        colissionsObstacle.x0=pPosX + player.w+ 20;
        colissionsObstacle.y0=pPosY+player.h/2;
      }
      soundObstacle.play();
    }

    if (overlapsBullet()) {
      bullet.init();
      bullet.timer =0;
      posX = lanes2[(int) random(lanes2.length)];
      posY = lanes[(int) random(lanes.length)] +25;
      soundObstacle.play();
    }
  }

  boolean overlapsBullet() {
    // Calculate the distance between the player and an enemy
    float a = posX-bullet.posX, // horizontal distance between player and enemy
      b = posY-bullet.posY, // vertical distance between player and enemy
      c = sqrt(a*a + b*b); // diagonal distance between player and enemy
    // if distance < radii combined, they overlap
    return c < (w/2 + bullet.diameter/2);    
  }
}