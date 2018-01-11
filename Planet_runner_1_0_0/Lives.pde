public class Lives {
  //begin aantal levens
  float aLives = 3;

  //levensbalk
  float healthbarh = 15;
  float healthbarw = 300;
  float healthbarposX = 15;
  float healthbarposY = 25;

  void init() {
  }
  void draw() {
    image(pow3, 150, 13);
    //Lives Display
    fill(0, 0, 0);
    stroke(255, 255, 255);
    rect(14, 24, 126, 16);
    noStroke();
    fill(255, 0, 0);
    rect(healthbarposX, healthbarposY, healthbarw, healthbarh);
    if (lives.aLives < 1) {
      healthbarw = 0;
    } else if (lives.aLives < 2 && lives.aLives > 0) {
      healthbarw = 25;
    } else if (lives.aLives < 3 && lives.aLives > 1) {
      healthbarw = 50;
    } else if (lives.aLives < 4 && lives.aLives > 2) {
      healthbarw = 75;
    } else if (lives.aLives < 5 && lives.aLives > 3) {
      healthbarw = 100;
    } else if (lives.aLives < 6 && lives.aLives > 4) {
      healthbarw = 125;
    }
    //Als alle lives gebruikt zijn wordt de speler naar het eindscherm gebracht
    if (aLives < 1) {
      stage = 3; 
      //reset het aantal levens 
      aLives = 3;
    }
  }
  void update() {
  }
}