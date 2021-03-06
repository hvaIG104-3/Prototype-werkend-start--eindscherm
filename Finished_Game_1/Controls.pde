//deze class zorgt ervoor dat de input van de gebruiker wordt omgezet naar handelingen in de game

class Controls {
  int pauzeController;
  boolean omhoog;
  boolean omlaag;
  boolean links;
  boolean rechts;

  void setup() {
    // als er een controller is aangesloten declareert hij hier de verschillende knoppen
    if (cont != null) {
      goTry = cont.getButton("goTryAgain");
      goScore = cont.getButton("goScoreboard");
      goExit = cont.getButton("goExit");
      startKnop = cont.getButton("start_knop");
      move = cont.getHat("move");
      goResume = cont.getButton("goResume");
    }
  }
  void keyPressed() {
    //verwerkt de user input vanaf keyboard

    //algemeen gebruik door hele game
    if (keyCode =='E') {//sluit de game af
      exit();
    }
    if (keyCode =='M') { //stopt de muziek
      music.stop();
    }    

    if (keyCode == 'P') {
      pauze = true;
    }

    if (keyCode == 'R') {
      pauze = false;
    }
    //input voor startscherm
    if (stage == 1) {
      if (key == ' ' ) {
        music.play();
        stage = 2;
        //sound 1 start//
              }
    }
    //input tijdens de game zelf (nog mee bezig werkend te krijgen
    if (stage == 2) {
      if (keyCode == 'Q') {
        if (!bullet.isFired) { // Only if it has NOT been fired yet...
          bullet.fire(); // shoot the bullet
        }
      }
    }
    //input voor eindscherm
    if (stage == 3) {
      if (keyCode == LEFT) {     //keycode left zorgt ervoor dat je terug gaat naar stage 1 (startscherm
        reset();
        stage =1;
      } else if (keyCode == RIGHT) {//keycode left zorgt voor exit
        exit();
      } else if (keyCode == 'S') { //keycode S zorgt ervoor dat naar stage 4 (scoreboard) gaat
        stage = 4;
      }
    }
    //input scoreboard
    if (stage == 4) {
      if (keyCode == 'Q') { //zorgt dat je doorgaat naar eindscherm
        stage = 3;
      }
    }
  }

  void getUserInput() {
    //verwerkt de user input vanaf keyboard (in progress)
    if (cont != null) {
      setup();
      // input voor startscherm
      if (stage == 1) {

        boolean startGame = goResume.pressed(); //start game
        if (startGame == true) {
          stage = 2;
          //sound 1 start//
          music.play();
          //stopt intro sound//
          //soundIntro.stop();
        }
      }
      //input voor game zelf, de player movement
      if (stage == 2) {
        //handeling voor pauze
        if (pauzeController ==1) {
          pauze = true;
        } else if (pauzeController ==2) {
          pauze = false;
        }

        //in game commands
        if (startKnop.pressed()) {
          pauzeController = 1;
        }
        if (goResume.pressed()) {
          pauzeController = 2;
        }
        if (goExit.pressed()) {
          exit();
        }   
        if (goResume.pressed()) {
          if (!bullet.isFired) { // Only if it has NOT been fired yet...
            bullet.fire(); // shoot the bullet
          }
        }

        //player movement
        omhoog = move.up();
        pPosY += omhoog ? -5 * 1 : 0; 

        omlaag = move.down();
        pPosY += omlaag ? 5 * 1 : 0;


        links = move.left();
        pPosX += links ? -5 * 1 : 0;

        rechts = move.right();
        pPosX += rechts ? 5 * 1 : 0;
      }
      //input voor eindscherm
      if (stage == 3) {

        boolean tryAgain = goTry.pressed();
        if (tryAgain == true) { //speel opnieuw
          reset();
          stage =1;
        }
        boolean exit = goExit.pressed();
        if (exit == true) { //sluit af
          exit();
        }
        boolean highScore = goScore.pressed();
        if (highScore == true) { //ga naar scoreboard
          stage = 4;
        }
      }
      //input voor scoreboard
      if (stage == 4) {
        boolean back = goExit.pressed(); 
        stage -= back ? 1 : 0; //zorgt ervoor dat terug naar eindscherm gaat
      }
    }
  }
}