//update
//Text voor aantal lives x veranderd naar 10 zodat beter te zien is

public class Lives {
  //begin aantal levens
  int aLives = 3;

  void init() {
  }
  void draw() {
//Lives Display
fill(0,0,0);
textSize(130);
text(lives.aLives, 72, 72);

fill(255,0,0);
textSize(120);
text(lives.aLives, 70, 70);

      image(pow3, 70, 45);

    //Als alle lives gebruikt zijn sluit het spel af. (Te veranderen naar eindscherm)
    if (aLives < 1) {
      stage = 3; 
      aLives =3;
      //Aantal levens = nooit groter dan 5
      if (aLives > 5) {
        aLives = 5;
      }
    }
  }
  void update() {
  }
}
