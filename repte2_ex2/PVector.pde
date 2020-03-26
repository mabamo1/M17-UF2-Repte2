class PVector
{
  float x, y;
  
  //Constructor.
  PVector(float x_, float y_) {
    this.x = x_;
    this.y = y_;
  }
  
  void add(PVector v) {
    x = x + v.x;
    y = y + v.y;
  }
}
