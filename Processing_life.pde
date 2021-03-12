
int x_origin = 10;
int y_origin = 10;

int x = 10;
int y = 10;

ArrayList<ArrayList<Square>> my_squares = new ArrayList<ArrayList<Square>>();

void setup() {
  size(1200, 800);
  //fullScreen();
  make_squares();
}

void draw() {
  draw_squares(); 
  update_board();
  delay(50);
}

void update_board() {
  for (int i = 0; i < my_squares.size(); i += 1) {
    ArrayList<Square> curr_column = my_squares.get(i);
    
    for (int j = 0; j < my_squares.get(0).size(); j += 1) {
      //Get current square
      Square curr = curr_column.get(j);
      
      //Get neighbor count for curr square
      int neighbors = 0;
      
      for (int x = -1; x < 2; x += 1) {
        for (int y = -1; y < 2; y += 1) {
          if (x == 0 && y == 0) {
            continue;
          }
          
          //Code to get index with wrap around effect
          int check_x = (i + x + my_squares.size()) % my_squares.size();
          int check_y = (j + y + curr_column.size()) % curr_column.size(); //<>//
          
          if (my_squares.get(check_x).get(check_y).get_status() == 1) {
            neighbors += 1;
          }
          
        }
      }
      
      //Set status based on neighbor count
      if (curr.get_status() == 0 && neighbors == 3) {
        curr.set_next(1);
      } else if (curr.get_status() == 1 && (neighbors == 2 || neighbors == 3)) {
        curr.set_next(1);
      } else {
        curr.set_next(0);
      }
    }
  }
}

void draw_squares() {
  background(200);
  //Draw the new squares
  for (ArrayList<Square> squares: my_squares) {
    for (Square square: squares) {
      square.draw_me();
    }
  }
}

void make_squares() {
  for (int i = 0; i < (height - 20) / 20; i += 1) {
    ArrayList<Square> tmp_squares = new ArrayList<Square>();
    for (int j = 0; j < (width - 20) / 20; j += 1) {
       Square tmp_square = new Square(x, y, 20);
       tmp_squares.add(tmp_square);
       
       x += 20;
       
    }
    
    my_squares.add(tmp_squares);
    
    x = x_origin;
    y += 20;
  }
}
