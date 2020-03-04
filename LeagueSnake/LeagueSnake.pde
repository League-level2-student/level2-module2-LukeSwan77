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
ArrayList<Segment> segments = new ArrayList<Segment>();

//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*


void setup() {
size(500,500);
head = new Segment(10,10);
frameRate(10);  
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
  fill(255,255,255);
  text("Score: " + foodEaten, 250, 25);
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
  manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
  for(int i = 0; i < segments.size(); i++ ){
    fill(0,0,255);
    rect(segments.get(i).x, segments.get(i).y, 10, 10);
  }
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  segments.add(new Segment(head.x, head.y));
  segments.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for(int i = 0; i < segments.size(); i++){
    if(head.x == segments.get(i).x && head.y == segments.get(i).y){
    foodEaten--;
    segments.clear();
    segments.add(new Segment(head.x, head.y));
    foodEaten = 0;
  }
  }
  
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode == 38 && direction != DOWN){
    direction = UP;
  } else if (keyCode == 40 && direction != UP){
    direction = DOWN;
  } else if (keyCode == 37 && direction != RIGHT){
    direction = LEFT;
  } else if (keyCode == 39 && direction != LEFT){
    direction = RIGHT;
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(direction) {
  case UP:
    head.y -= 10;
    break;
  case DOWN:
    head.y += 10;
    break;
  case LEFT:
   head.x -= 10;
    break;
  case RIGHT:
    head.x += 10;
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
      foodEaten++;
      dropFood();
      segments.add(new Segment(head.x, head.y));
    }
}
