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
<<<<<<< HEAD
    velX = random(-6,-4); //De snelheid waarmee de objecten bewegen
=======
    velX = -5; //De snelheid waarmee de objecten bewegen
>>>>>>> 5a6f1ebf6fcd2b801b9c64cfbe6f1f536dc68a41
  }

  void draw() {
    //Hier worden de obstakels aangemaakt
     image(img2, posX, posY,w,h);
      posX += velX;

      //Als het obstakel het scherm verlaat dan spawned hij weer in een random lane
      if (posX <= -w) {
        posY = lanes[(int) random(lanes.length)] + 25;
        posX = lanes2[(int) random(lanes2.length)];
      }

      //Als de speler een obstakel raakt, verliest hij een levenspunt en verdwijnt het obstakel van het scherm.
      if (!(player.posX + player.w < posX || player.posY > posY + h|| player.posY+player.h < posY)) {
        lives.aLives--;
        posX = lanes2[(int) random(lanes2.length)];
        posY = lanes[(int) random(lanes.length)] +25;
      }
    }
    
  }