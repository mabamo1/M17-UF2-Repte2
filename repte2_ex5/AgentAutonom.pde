class AgentAutonom {
int x, y;
  
  //Constructor per defecte.
  AgentAutonom() {
    x = width/2;
    y = height/2;
  }
  
  void walk(){
    int choice = int(random(4));
    //print("Choice: " + choice + "|");
    switch (choice) {
      case 0:
        x++;
        break;
      case 1:
        x--;
        break;
      case 2:
        y++;
        break;
      default:
        y--;
        break;
    }
  }
  
  void display() {
    stroke(0);
    point(x,y);
  }
}
