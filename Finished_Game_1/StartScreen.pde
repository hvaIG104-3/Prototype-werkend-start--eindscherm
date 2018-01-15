//Class zorgt ervoor dat als je game start eerst een startscreen krijgt en je een key moet gebruiken om de game te starten.

class StartScreen {
  //declareert startscreen als afbeelding 
  PImage startScreen;
  PImage title;
  PImage start;



  void setup() {
    //laad de afbeelding in het mapje met met naam startScreen.jpg
    startScreen = loadImage("Images/background1.jpg");
    //geeft de grote aan de eerste 2 nullen weet ik niet precies wat is ik denk draai, de achterste 2 zijn de verhoudingen
    image(startScreen, 0, 0, 800, 600);
    title = loadImage("Images/title.png");
    if (cont != null){
    start = loadImage("Images/startController.png");
    }else {
    start = loadImage("Images/start.png");
    }
  }

  void draw() {
    //soundIntro.play();
     
    //soundStart.play();
    image(title, 0, 100, 800, 98);
    image(start, 150, 350, 522, 53);
  }
}