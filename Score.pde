//Zorgt er op dit moment alleen voor dat punten opscherm komen

class Score {
  Pu_exp exp = new Pu_exp();
  void setup() {
  }

  void draw() {
    if (stage==2) {

      //Dit laat de punten op het scherm zien
      fill(255, 0, 0);
      textSize(20);
      //laat de punten afgerond zien op het scherm

      text(round(punten), 750, 25);
      //inplaats van dat je punten krijgt voor elke vijand die voorbij komt krijg je nu 0.1 punt per frame
      punten = punten + 0.1;
    }
  }

  void reset() {
    punten = 0;
  }

  void update() {
  }
}