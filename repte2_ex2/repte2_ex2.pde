// ## Exercici 8 del Repte 1 modificat per treballar amb Vectors. ##
// ## El codi "antic" no s'ha eliminat, només està comentat amb "##". ##

// Variables que guardaràn un nombre enter 
// ràndom per canviar el color del cercle.
int randomR;
int randomG;
int randomB;

// Amplada del cercle.
int widthCercle = 50;  

// Posició inicial del cercle.
//##float posicioX, posicioY; 
PVector posicio;

// Velocitats fixes del moviment del cercle.
//##float velocitatX = 2.8;  
//##float velocitatY = 2.8; 
PVector velocitat;

// Direccions del moviment del cercle (dreta & esquerra i nord & sud).
//##int direccioX = 1;
//##int direccioY = 1;

void settings() {
  // Creem la finestra amb una mida fixa.
  // Utilitzem el mètode settings() ja que Processing donava un error.
  size(840, 560);
}
void setup() 
{
  //donem un número de fps predeterminat.
  frameRate(60);
  ellipseMode(RADIUS);
  
  // Incialment, posem el cercle al mig de la finestra.
  //##posicioX = width/2;
  //##posicioY = height/2;
  posicio = new PVector(width/2,width/2);
  // Velocitats fixes del moviment del cercle.
  velocitat = new PVector(2.8,2.8);
  
  // Generem de manera ràndom el primer color que tindrà el cercle.
  randomR = int(random(255));
  randomG = int(random(255));
  randomB = int(random(255));
}

void draw() 
{
  // Pintem el fons negre.
  background(0);
  
  // Anem movent el cercle per la pantalla.
  /*##posicioX = posicioX + ( velocitatX * direccioX );
  posicioY = posicioY + ( velocitatY * direccioY ); */
  posicio.add(velocitat);
  
  // Canviem la direcció i el color del cercle en funció d'on rebota.
  /*##if (posicioX > width-widthCercle || posicioX < widthCercle) {
    direccioX *= -1;
    randomR = int(random(255));
    randomG = int(random(255));
    randomB = int(random(255));
  }
  if (posicioY > height-widthCercle || posicioY < widthCercle) {
    direccioY *= -1;
    randomR = int(random(255));
    randomG = int(random(255));
    randomB = int(random(255));
  } */
   if ((posicio.x > width-widthCercle) || (posicio.x < widthCercle)) {
    velocitat.x *= -1;
    randomR = int(random(255));
    randomG = int(random(255));
    randomB = int(random(255));
   }
   if ((posicio.y > height-widthCercle) || (posicio.y < widthCercle)) {
    velocitat.y *= -1;
    randomR = int(random(255));
    randomG = int(random(255));
    randomB = int(random(255));
   }

  // Dibuixem el cercle i el pintem amb el color ràndom.
  fill(randomR,randomG,randomB);
  ellipse(posicio.x, posicio.y, widthCercle, widthCercle);
  
  // Debug de la posicióX per proves.
  print("X." + int(posicio.x)+"-");
}
