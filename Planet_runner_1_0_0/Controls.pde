//deze class zorgt ervoor dat de input van de gebruiker wordt omgezet naar handelingen in de game

class Controls {
  boolean omhoog;
  boolean omlaag;
  int test;

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
      file.stop();
    }

    if (keyCode == 'P') {
      pauze = true;
    }

    if (keyCode == 'X') {
      pauze = false;
    }

    //input voor startscherm
    if (stage == 1) {
      if (key == ' ' ) {
        stage = 2;
        //sound 1 start//
       
        file.play();
        //stopt intro sound//
        //soundIntro.stop(); 
        }
    }
    //input tijdens de game zelf (nog mee bezig werkend te krijgen
    if (stage == 2) {
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
          file.play();
          //stopt intro sound//
          //soundIntro.stop(); 
        }
      }
      //input voor game zelf, de player movement
      if (stage == 2) {
        //handeling voor pauze
        if (test ==1) {
          pauze = true;
        } else if (test ==2) {
          pauze = false;
        }
        
        //in game commands
        if (startKnop.pressed()) {
          test = 1;
        }
        if (goResume.pressed()) {
          test = 2;
        }
        if (goExit.pressed()){
          exit();
        }
        
        
        //player movement
        omhoog = move.up();
        pPosY += omhoog ? -5 * 1 : 0; 

        omlaag = move.down();
        pPosY += omlaag ? 5 * 1 : 0;
      }
      //input voor eindscherm
      if (stage == 3) {
        boolean tryAgain = move.left();
        if (tryAgain == true) { //speel opnieuw
          reset();
          stage =1;
        }
        boolean exit = move.right();
        if (exit == true) { //sluit af
          exit();
        }
        boolean highScore = move.up();
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