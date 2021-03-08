
int board_width = 600;
int board_height = 300;

int x_origin = 10;
int y_origin = 10;

int x = 10;
int y = 10;

ArrayList<String> my_strings = new ArrayList<String>();

void setup() {
  size(620, 320); 
  stroke(200);
}

void draw() {
  for (int i = 0; i < board_height / 20; i += 1) {
    for (int j = 0; j < board_width / 20; j += 1) {
       rect(x, y, 20, 20);
       
       x += 20;
    }
    
    x = x_origin;
    y += 20;
  }
  
  y = y_origin;
  
}
