// to represent the background grid 
// wich is 17 x 25 
int grid[][] = new int [17][25];
// to represent s new cell
Cells current = new Cells();
// to represent the current position of the cell
int curPos[] = new int[2];
// to represent the time
int time = 0;
// to represent a PFont
PFont f;
// to represent the score 
int score;

// to represent the setup method
void setup() { 
  // to represent the background size 
  // which is 300 x 475 
  size(300, 475);
  // assign 4 to the first currentPos
  curPos[0] = 4;
  // assign 0 to the second currentPos
  curPos[1] = 0;
  // creat a font that is "Courier-Bold", size 24
  f = createFont("Courier-Bold", 24);
  // initial score is 0
  score = 0;
} 

// to represent the draw method
void draw() { 
  // draw the background grid
  background(237, 87, 82);
  noStroke();
  // draw the falling cells from the top 
  for(int i = 0; i < 17; i++) { 
    for(int j = 0; j < 25; j++) { 
      if(grid[i][j] == 0) { 
        fill(182, 191, 237);
      } else if(grid[i][j] == 1) {
        fill(0, 255, 0);
      } else if (grid[i][j] == 2) { 
        fill(0, 0, 225);
      } else if (grid[i][j] == 3) { 
        fill(227, 117, 117);
      } else if (grid[i][j] == 4) { 
        fill(216, 252, 41);
      } else if (grid[i][j] == 5) { 
        fill(4, 7, 21);
      } else if (grid[i][j] == 6) { 
        fill(150, 0, 150 );
      } else { 
        fill(82, 86, 100);
      }
      // to represent the background grid, which
      // is made by 13 x 13 sqaures
      rect(i*15+25,  j*15 + 25,  13, 13);
    } 
  }
  // call displayCurrent funtion 
  // to display the falling cells 
  // in every seconds
  displayCurrent();
  time++; 
  if(time > 20) { 
    time = 0;
    curPos[1]++;
  } 
  // update the grid 
  update();
  fill(255);
  text("Score: " + score, 100, 430);
  textFont(f);
  
  
}

// to represent the cell class 
class Cells{ 
  // to represent a 2d array of shape
  // with the given position 
  int shape[][] = new int[4][2];
  // initialize the color number
  int c = 0;
  Cells() { 
    // randomly assign the color number 
    c = (int)(random(1, 8));
    // depends on different situation, (color num difference)
    // the shape is also different  
    if(c == 1) { 
      shape[1][0] = 1;
      shape[2][0] = -1;
      shape[3][0] = -2;
    } else if(c == 2) { 
      shape[1][0] = 1;
      shape[2][0] = -1;
      shape[3][0] = -1;
      shape[3][1] = -1;
    } else if(c == 3) { 
      shape[1][0] = 1;
      shape[2][0] = -1;
      shape[3][0] = 1;
      shape[3][1] = -1;
    } else if(c == 4) { 
      shape[1][0] = 1;
      shape[2][1] = 1;
      shape[3][0] = 1;
      shape[3][1] = 1;
    } else if(c == 5) { 
      shape[1][0] = -1;
      shape[2][1] = -1;
      shape[3][0] = 1;
      shape[3][1] = -1;
    } else if(c == 6) { 
      shape[1][0] = 1;
      shape[2][0] = -1;
      shape[3][1] = -1;
    } else { 
      shape[1][0] = 1;
      shape[2][1] = -1;
      shape[3][0] = -1;
      shape[3][1] = -1;
    } 
  }
  
// to rotate the shape  
 void rotating() { 
    for (int i = 0; i < 4; i++) { 
      int a = shape[i][0];
      shape[i][0] = shape[i][1];
      shape[i][1] = - a;
    }
  }
  
  // to get the x position of the shape
 int getShapeX(int i) { 
    return shape[i][0];
  }
 
 // to get the y position of the shape
 int getShapeY(int i) { 
    return shape[i][1];
  }
 
  // to get the maximum x position
 int getMaxX() { 
    int i = 0;
    for (int j = 0; j < 4; j++) { 
      if(shape[j][0] > shape[i][0]) { 
        i = j;
      }
    }
    return shape[i][0];
  }  

// to get the minimum x position
int getMinX() { 
    int i = 0;
    for (int j = 0; j < 4; j++) { 
      if(shape[j][0] < shape[i][0]) { 
        i = j;
      }
    }
    return shape[i][0];
  }
  
 // to get the maximum y position
 int getMaxY() { 
    int i = 0;
    for (int j = 0; j < 4; j++) { 
      if(shape[j][1] > shape[i][1]) { 
        i = j;
      }
    }
    return shape[i][1];
  }  

// to get the minimum y position
int getMinY() { 
    int i = 0;
    for (int j = 0; j < 4; j++) { 
      if(shape[j][1] < shape[i][1]) { 
        i = j;
      }
    }
    return shape[i][1];
  }
 
 // to get the color of a shape 
 int getColor() { 
    return c;
  }
}



// to display the current shape
// when calling this method from draw, which will update the current shape's position 
// within every second
 void displayCurrent() { 
  if(current.getColor() == 0) { 
        fill(182, 191, 237);
      } else if(current.getColor() == 1) {
        fill(0, 225, 0);
      } else if (current.getColor() == 2) { 
        fill(0, 0, 255);
      } else if (current.getColor() == 3) { 
        fill(227, 117, 117);
      } else if (current.getColor() == 4) { 
        fill(216, 252, 41);
      } else if (current.getColor() == 5) { 
        fill(4, 7, 21);
      } else if (current.getColor() == 6) { 
        fill(150, 0, 150 );
      } else { 
        fill(82, 86, 100);
      }
      for(int i = 0; i < 4; i++) { 
        // update the shape's width, height and position within the given range 
        rect((current.getShapeX(i) + curPos[0])*15+25,  
        (current.getShapeY(i) + curPos[1])*15 + 25,  13,13);
      }
}

// to represent the end of the game 
void end() { 
  fill(0, 200);
  rect(0, 0, width, height);
  fill(0, 255, 0);
  // make the draw method to stop 
  noLoop();
} 

/* to update the grid
   with the falling cells. 
   The falling cells will stop when 
   they reach the bottom of the grid
   and if they fill all the blocks in 
   a horizontal line, that line will disappear. 
   If the cells lande up to the top, the game will end
*/
void update() { 
  // initialize a boolean variable
  // to represent when to stop 
  boolean stop = false;
  for(int i = 0; i < 4; i++) {   
      if((current.getShapeY(i) + curPos[1]) < 24) { 
            if(grid[(current.getShapeX(i) + curPos[0])]
                   [(current.getShapeY(i) + curPos[1]) + 1] != 0) { 
              stop = true;
            } 
          
      } else { 
        stop = true; 
      }
  }
       
      if(stop) { 
        for(int i = 0; i < 4; i++) { 
            if(current.getShapeY(i) + curPos[1] < 0) { 
              end(); 
            } else { 
               grid[current.getShapeX(i) + curPos[0]]
                   [current.getShapeY(i) + curPos[1]] = current.getColor();
        } 
      }
      for(int y = 0; y < 25; y++) { 
        boolean destroy = true;
        for(int x = 0; x < 17; x++) { 
           if(grid[x][y] == 0) { 
              destroy = false;
           } 
        }
        if(destroy) {  
          score = score + 10;
          for(int y2 = y-1; y2 > -1; y2--) { 
            for(int x = 0; x < 17; x++) { 
              grid[x][y2+1] = grid[x][y2];
            } 
            
          } 
        } 
      }
      
      current = new Cells();
      curPos[0] = 4;
      curPos[1] = 0;
      
      for(int i = 0; i < 4; i++) { 
      if((current.getShapeY(i) + curPos[1]) < 24) { 
        if ((current.getShapeX(i) + curPos[0]) < 16
          &&(current.getShapeY(i) + curPos[1]) > 0
          &&(current.getShapeY(i) + curPos[1]) > 24) { 
            if(grid[(current.getShapeX(i) + curPos[0])]
                   [(current.getShapeY(i) + curPos[1]) + 1 ] != 0) { 
              end();
            } 
          }
      }
      }
  
  } 
}


// to represent the keyPressed method 
// if the player press the up key, the falling shape will rotate
// if the player press the down key, the falling shape will increase its speed
// by adding 1 to its y-cordinate
// if they player press the left key, the falling shape will move over to the left 
// by one grid
// if they player press the right key, the falling shape will move over to the right 
// by one grid
void keyPressed() { 
  if(keyCode == 37) { 
    boolean stop = false;
    for(int i = 0; i < 4; i++) { 
      if((current.getShapeX(i) + curPos[0]) > 0) { 
        if ((current.getShapeX(i) + curPos[0]) < 16
          &&(current.getShapeY(i) + curPos[1]) > 0
          &&(current.getShapeY(i) + curPos[1]) < 24) { 
            if(grid[(current.getShapeX(i) + curPos[0]) - 1]
                   [(current.getShapeX(i) + curPos[0])] != 0) { 
              stop = !stop;
            } 
          }
      } else { 
        stop = true;
    }
  } 
  if(!stop) { 
    curPos[0]--;
  }
  }
  
  else if(keyCode == 38) { 
    current.rotating();
    if(current.getMinX() + curPos[0] < 0) { 
      curPos[0] -= (current.getMinX() + curPos[0]);
    }
    
    if(current.getMaxX() + curPos[0] > 16) { 
      curPos[0] -= (current.getMinX() + curPos[0] - 16);
    }
    
    if(current.getMinY() + curPos[1] < 0) { 
      curPos[0] -= (current.getMinY() + curPos[1]);
    }
    
    if(current.getMaxY() + curPos[1] > 24) { 
      curPos[0] -= (current.getMaxY() + curPos[1] - 24);
    }
    
  }
  
  else if(keyCode == 39) { 
    boolean stop = false;
    for(int i = 0; i < 4; i ++) { 
      if((current.getShapeX(i) + curPos[0]) < 16) { 
        if ((current.getShapeX(i) + curPos[0]) > 0 
          &&(current.getShapeY(i) + curPos[1]) > 0
          &&(current.getShapeY(i) + curPos[1]) < 24) { 
            if(grid[(current.getShapeX(i) + curPos[0]) + 1]
                   [(current.getShapeX(i) + curPos[0])] != 0) { 
              stop = true;
            } 
          }
      } else { 
        stop = true;
    }
  } 
  if(!stop) { 
    curPos[0]++;
  }
  }
  
  else if(keyCode == 40) { 
    curPos[1]++;
    update();
  }
} 