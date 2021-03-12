class Square {
  
  int x;
  int y;
  int len;
  
  int curr_state = 0;
  int next_state = 0;
  
  int count_alive = 0;
  int threshold = 15;
  
  int count_dead = 0;
  int count_every_other = 0;
  
  color orig_color = color(255, 166, 201);
  color curr_color = color(255, 166, 201);
  color target_color = color(150, 0, 24);
  color skipped_color = color(0, 135, 189);
  
  Square(int x_spot, int y_spot, int len) {
    x = x_spot;
    y = y_spot;
    this.len = len;
    next_state = (int)random(2);
  }
  
  void draw_me() {
    curr_state = next_state;
    stroke(200);
    
    //Used to figure out the gradient spot
    float n;
    
    //If alive
    if (curr_state == 1) {
      count_alive += 1;
      
      //If count_dead = 1, inc count_every_other
      if (count_dead == 1) {
        count_every_other += 1;
      } else {
        count_every_other = 0;
      }
      
      count_dead = 0;
      
      //Set to pink gradient if count_alive is 2 or more
      if (curr_state == 1 && count_alive > 1) {
        
        //If count alive is less than threshold, find gradient value.  Else get target color
        if (count_alive < threshold) {
          n = count_alive % threshold;
          n = map(n, 0, threshold, 0, 1);
        } else {
          n = 1;
        }
        
        curr_color = lerpColor(orig_color, target_color, n);
        
        //Set to blue gradient if alive and count_every_other is 3 or more
      } else if (curr_state == 1 && count_every_other > 2) {
        if (count_every_other < threshold) {
          n = count_every_other % threshold;
          n = map(n, 0, threshold, 0, 1);
        } else {
          n = 1;
        }
        
        curr_color = lerpColor(orig_color, skipped_color, n);
    
      }
      
      //Dead, reset count_alive and increment count_dead.  Reset the color to pink
    } else {
      count_alive = 0;
      count_dead += 1;
      //Reset the color
      curr_color = color(255, 166, 201);
    }
    
    //Draw the square
    if (curr_state == 1) {
      fill(curr_color);
    } else {
      fill(240, 248, 255);
    }
    
    rect(x, y, len, len);
  }
  
  int get_status() {
    return curr_state;
  }
  
  void set_next(int next) {
    next_state = next;
  }
  
}
