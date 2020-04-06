// Creem els dos personatges que hereten de AgentAutonom (walker).
Personatge warrior, enemy;
// Creem quatre PVector per guardar les posicions i les posicions inicials dels Personatges.
PVector posWarrior, posEnemy;
PVector posInicialW, posInicialE;
// Creem un boleà per controlar si algún dels dos personatges ha guanyat.
boolean guanyador = false;

void setup() {
  size(650,650);
  // Inicialitzem els PVectors de la posició inicial al mig de la pantalla 
  // amb 60 unitats de distància respecte ells mateixos.
  posInicialW = new PVector(width/2-30,height/2);
  posInicialE = new PVector(width/2+30,height/2);
  // Inicialitzem els Personatges de l'escena 
  // amb el constructor de la classe Personatge(pos inicial, valors r g b, vides, mida, nom).
  warrior = new Personatge(posInicialW,0,255,0,5,30, "Warrior");
  enemy = new Personatge(posInicialE,255,0,0,3,30, "Enemy");
}

void draw() {
  // Anem pintant el fons de l'escena sempre de blanc.
  background(255);
  
  // Si no hi ha cap guanyador, anem dibuixant la línia entre els dos personatges 
  // i també calculem la distància respecte el personatge 'Warrior'.
  if(!guanyador) {
    posWarrior = new PVector(warrior.getPosX(),warrior.getPosY());
    posEnemy = new PVector(enemy.getPosX(),enemy.getPosY());
    
    line(posWarrior.x,posWarrior.y,posEnemy.x,posEnemy.y);
    
    enemy.setDistanciaAmbWarrior(calcularDistanciaAmbWarrior());
  }
  // Si la distància amb el Warrior és inferior a 31, 
  // el Warrior perd una vida i tornem a la posició inicial.
  if(calcularDistanciaAmbWarrior() <= 30) {
    warrior.restarVida();
    retornarPosicioInicial();
  }
  // Si la distància amb el Warrior és superor a 100, 
  // el Enemy perd una vida i tornem a la posició inicial.
  if(calcularDistanciaAmbWarrior() > 100) {
    enemy.restarVida();
    retornarPosicioInicial();
  }
  // Si el Warrior continua tenint vides, continua el joc. 
  // Sinó el deixem de dibuixar i posem els noms de Winner i Loser a cada personatge.
  if(warrior.getVides() > 0){
    warrior.walk();
    warrior.display();
  } else {
    warrior.setNomPersonatge("Loser");
    enemy.setNomPersonatge("Winner");
    guanyador = true; // Controlem que ja hi ha hagut un guanyador.
  }
  // Si el Enemy continua tenint vides, continua el joc. 
  // Sinó el deixem de dibuixar i posem els noms de Winner i Loser a cada personatge.
  if(enemy.getVides() > 0){
    enemy.walk();
    enemy.display();
  } else {
    enemy.setNomPersonatge("Loser");
    warrior.setNomPersonatge("Winner");
    guanyador = true; // Controlem que ja hi ha hagut un guanyador.
  }
}

// Mètode per calcular (amb valor absolut, és a dir, sense valors negatius)
// la distància del Enemy respecte la del Warrior.
int calcularDistanciaAmbWarrior() {
  int dis;
  dis = (int)posWarrior.x - (int)posEnemy.x;
  dis = abs(dis);
  //print("Distancia: " + dis);
  return dis;
}

// Mètode que fa que ambós personatges retornin a la posició inicial de l'escena.
void retornarPosicioInicial() {
  warrior.setPosX((int)posInicialW.x); 
  warrior.setPosY((int)posInicialW.y); 
  enemy.setPosX((int)posInicialE.x); 
  enemy.setPosY((int)posInicialE.y);  
}
