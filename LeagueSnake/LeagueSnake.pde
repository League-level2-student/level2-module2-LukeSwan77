//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x;
int y;

// Add a constructor with parameters to initialize each variable.
  Segment(int x, int y){
   this.x = x;
   this.y = y;
  }


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*

Segment head;
int foodX;
int foodY;
int direction = UP;
int foodEaten = 0;


//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*


void setup() {
size(500,500);
head = new Segment(20,20);
frameRate(30);  
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0,0,0);
  drawFood();
  move();
  drawSnake();
  checkBoundaries();
  eat();
}

void drawFood() {
  //Draw the food
  fill(0,255,0);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(355,0,0);
  rect(head.x, head.y, 10, 10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode == 38){
    direction = UP;
  } else if (keyCode == 40){
    direction = DOWN;
  } else if (keyCode == 37){
    direction = LEFT;
  } else if (keyCode == 39){
    direction = RIGHT;
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(direction) {
  case UP:
    head.y--;
    break;
  case DOWN:
    head.y++;
    break;
  case LEFT:
   head.x--;
    break;
  case RIGHT:
    head.x++;
    break;
  }
  
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.x < 0){
   head.x = 500;
 } else if(head.x > 500) {
   head.x = 0;
 } else if(head.y < 0){
 head.y = 500;
 } else if (head.y > 500){
   head.y = 0;
 }
 }



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
    if (head.x == foodX && head.y == foodY){
      foodEaten = 2;
      dropFood();
    }
}
