//Class zorgt ervoor dat als je game start eerst een startscreen krijgt en je een key moet gebruiken om de game te starten.

class StartScreen {
  //declareert startscreen als afbeelding 
  PImage startScreen;
  //declareert verschillende PFont (PFont is font class voor Processing
  PFont title;
  PFont startText;



  void setup() {
    //laad de afbeelding in het mapje met met naam startScreen.jpg
    startScreen = loadImage("startScreen.jpg");
    //geeft de grote aan de eerste 2 nullen weet ik niet precies wat is ik denk draai, de achterste 2 zijn de verhoudingen
    image(startScreen, 0, 0, 800, 600);
    //koppelt de juiste font aan de juiste PFont (via tools>lettertype maken, kan je een .vlw bestand maken met een font en grote)
    title = loadFont("titleFont.vlw");
    startText = loadFont("startText.vlw");
  }

  void draw() {
    // zorgt er voordat de text in uitlijnd in midden
    textAlign(CENTER);
    // geeft text weer ("text", X-coordinaat, Y_coordinaat)
    textFont(title);
    fill(255, 3, 3);
    text("Planet-runner", 400, 150);
    textFont(startText);
    text("Press Space key to start", 400, 400);
    //zorgt dat je vanuit stage 1(startscreen) gaat naar stage 2 (de game zelf)
    if (key == ' ' ) {
      stage = 2;
      //sound 1 start//
      file.play();
      //stopt intro sound//
      file2.stop();
    }
  }

  void update() {
  }
}
