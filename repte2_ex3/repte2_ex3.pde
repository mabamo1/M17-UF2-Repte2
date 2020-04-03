// Creem les variables que farem servir.
PVector punter, centre;
float magnitudActual;

void setup(){
  // Posem una mida fixa.
  size(650,650);
}

void draw(){
  // Pintem el fons de blanc.
  background(255);
  // Instanciem els PVectors corresponents.
  punter = new PVector(mouseX,mouseY);
  centre = new PVector(width/2,height/2);
  punter.sub(centre);

  // Posem el valor de la magnitud actual a la variable
  // i ho mostrem per consola. (La magnitud no està normalitzada).
  magnitudActual = punter.mag();
  print("La magnitud actual és: " + magnitudActual + " ## ");

  // Dibuixem des del centre de la pantalla la línia.
  translate(centre.x,centre.y);
  line(0,0,punter.x,punter.y);

}
