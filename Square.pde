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
  
  int[] orig_color = {255, 166, 201};
  int[] curr_color = {orig_color[0], orig_color[1], orig_color[2]};
  int[] target_color = {150, 0, 24};
  int[] skipped_color = {0, 135, 189};
  
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
        count_dead = 0;
      } else {
        count_every_other = 0;
      }
      
      //Set to pink gradient if count_alive
      if (curr_state == 1 && count_alive > 1) {
         
        if (count_alive <= threshold) {
          n = count_alive % threshold;
          n = map(n, 0, threshold, 0, 1);
        } else {
          n = 1;
        }
        curr_color[0] = (int)lerp(orig_color[0], target_color[0], n);
        curr_color[1] = (int)lerp(orig_color[1], target_color[1], n);
        curr_color[2] = (int)lerp(orig_color[2], target_color[2], n);
      } else {
        //Set to blue gradient because count alive = 1
        if (count_every_other <= threshold) {
          n = count_every_other % threshold;
          n = map(n, 0, threshold, 0, 1);
        } else {
          n = 1;
        }
        
        curr_color[0] = (int)lerp(orig_color[0], skipped_color[0], n);
        curr_color[1] = (int)lerp(orig_color[1], skipped_color[1], n);
        curr_color[2] = (int)lerp(orig_color[2], skipped_color[2], n);
    
      }
      
    } else {
      count_alive = 0;
      count_dead += 1;
      //Reset the color
      curr_color[0] = orig_color[0];
      curr_color[1] = orig_color[1];
      curr_color[2] = orig_color[2];
    }
    
    //Draw the square
    if (curr_state == 1) {
      fill(curr_color[0], curr_color[1], curr_color[2]);
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
