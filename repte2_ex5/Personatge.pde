// ** Clase Personatge(character) que hereda d'AgentAutonom (walker) **
class Personatge extends AgentAutonom {
  // Creem les variables que farà ús cada personatge.
  int[] colorPersonatge = new int[3];
  int numVides;
  int midaRadi;
  String nomPersonatge;
  String distanciaAmbWarrior = null;
  
  // Constructor per defecte.
  Personatge() {
  }
  // Constructor per inicialitzar correctament el Personatge.
  // Consta d'un PVector amb la posició inicial que haurà de pendre.
  // També dels valors R G B per el seu color.
  // La mida del radi (mRadi).
  // I per últim el seu nom (nPersonatge).
  Personatge(PVector posInicial, int r, int g, int b, int nVides, int mRadi, String nPersonatge) {
    colorPersonatge[0] = r;
    colorPersonatge[1] = g;
    colorPersonatge[2] = b;
    numVides = nVides;
    midaRadi = mRadi;
    nomPersonatge = nPersonatge;
    x = (int)posInicial.x;
    y = (int)posInicial.y;
  }
  
  // Fem una sobreescriptura del mètode display de la classe AgentAutonom.
  @Override
  void display() {
    stroke(0);
    // Mostrem a l'escena un cercle amb el color, la mida i la posició determinada per l'usuari.
    fill(colorPersonatge[0],colorPersonatge[1],colorPersonatge[2]);
    ellipse(x,y,midaRadi,midaRadi);
    
    // Posem al seu damunt el text referent a 
    // la seva informació (nom, vides i distància (si és el cas)).
    textSize(15);
    if(distanciaAmbWarrior != null) {text(distanciaAmbWarrior, x-15, y-48);}
    text(nomPersonatge, x-15, y-33);
    text("Vides: " + numVides, x-15, y-18);
  }
  
  // Mètodes per sumar o restar vides al personatge.
  void sumarVida() { this.numVides++; }
  void restarVida() { this.numVides--; }
  
  // Getters i Setters per agafar i posar 
  // valors com la posició, les vides, la distància o el nom.
  int getPosX() {
    return x;
  }
  int getPosY() {
    return y;
  }
  void setPosX(int x_) {
   x = x_;
  }
  void setPosY(int y_) {
   y = y_;
  }
  int getVides() {
    return numVides;
  }
  void setNomPersonatge(String nPersonatge) {
    nomPersonatge = nPersonatge;
  }
  void setDistanciaAmbWarrior(int distancia) {
    if(distancia != 0) {
      distanciaAmbWarrior = "" + distancia + " u.";
    }
  }
}
