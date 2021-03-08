class Square {
  
  int x;
  int y;
  int len;
  
  Square(int x_spot, int y_spot, int len) {
    x = x_spot;
    y = y_spot;
    this.len = len;
  }
  
  void draw_me() {
    rect(x, y, len, len);
  }
  
}
