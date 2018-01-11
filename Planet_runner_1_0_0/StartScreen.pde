//Class zorgt ervoor dat als je game start eerst een startscreen krijgt en je een key moet gebruiken om de game te starten.

class StartScreen {
  //declareert startscreen als afbeelding 
  PImage startScreen;
  //declareert verschillende PFont (PFont is font class voor Processing
  PFont titleText;
  PFont startText;
  PImage title;
  PImage start;



  void setup() {
    //laad de afbeelding in het mapje met met naam startScreen.jpg
    startScreen = loadImage("Images/startScreen.jpg");
    //geeft de grote aan de eerste 2 nullen weet ik niet precies wat is ik denk draai, de achterste 2 zijn de verhoudingen
    image(startScreen, 0, 0, 800, 600);
    //koppelt de juiste font aan de juiste PFont (via tools>lettertype maken, kan je een .vlw bestand maken met een font en grote)
    titleText = loadFont("Fonts/titleFont.vlw");
    startText = loadFont("Fonts/startText.vlw");
    title = loadImage("Images/title.png");
    start = loadImage("Images/start.png");
  }

  void draw() {
    image(title, 0, 100, 800, 98);
    image(start, 150, 350, 522, 53);
  }
}