
SpaceShip voyager = new SpaceShip();
Stars [] galaxy = new Stars[200];
Rockets booster = new Rockets();
Asteroids [] rocks = new Asteroids[25];
int myVariable; // used for setting the hyperspace variable to one common number
public void setup() 
  {
    size(1000, 1000);
    for (int i = 0; i < galaxy.length; i++) 
    {
        galaxy[i] = new Stars();   
    }
    for (int j = 0; j < rocks.length; j++) 
    {
        rocks[j] = new Asteroids();   
    }
  }
public void draw() 
  {
    background(0);
    for (int i = 0; i < galaxy.length; i++) // shows stars 
    {
       galaxy[i].show();
    }
    for (int j = 0; j < rocks.length; j++) // shows and moves asteroids
    {
        rocks[j].show();   
        rocks[j].move();
    }
    if (key == 's') // shows rocket booster whenever the ship acclerates
    {
      booster.show();
    }
    booster.move();
    voyager.show();
    voyager.move();
    // checking for collisions
    for (int i = 0; i < rocks.length; i++) 
    {
      if ( dist( voyager.getX(), voyager.getY(), rocks[i].getX(), rocks[i].getY() ) <= 25 )
      {
        textSize(40);
        text("BOOM!!!", 400, 500);
        text("You ded :( ", 400, 550);
      } 
    }
  }
public void keyPressed() 
   {
     if (key == 'a') // rotate counterclockwise
     {
        voyager.rotate(-12); 
        booster.rotate(-12); 
     }
     if (key == 'd')// rotate clockwise
     {
        voyager.rotate(12);
        booster.rotate(12);
     }
     if (key == 's') // acclerate
     {
        voyager.accelerate(2);
        booster.accelerate(2);
     }
     if (key == 'w') // stop
     {
        voyager.setDirectionX(0);
        voyager.setDirectionY(0);
        booster.setDirectionX(0);
        booster.setDirectionY(0);
     }
     if (key == 'q') // hyperspace
      {
          myVariable = (int)(Math.random()*1000);
          voyager.setY( myVariable );
          voyager.setX( myVariable );
          booster.setY( myVariable );
          booster.setX( myVariable );
      }
   }
class Stars
{
  private int radius, colors, myX, myY;
  public Stars()
  {
    radius = (int)(Math.random()*15);
    colors = (int)(Math.random()*255);
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*1000);
  }
  public void show()
  {
      fill(colors,colors,colors);
      noStroke();
      ellipse( myX, myY, radius, radius);
  }
}
class Rockets extends Floater 
{   
   public Rockets()
     { 
        corners = 5;  // draws rockets  
        int[] xS = { 0, -25, -15, -25, 0 } ;   
        int[] yS = { -2, -5, 0, 5, 2 } ;  
        xCorners = xS;
        yCorners = yS; 
        myColor = color(45,201,225);   
        myCenterX = 500;
        myCenterY = 500; //holds center coordinates   
        myDirectionX = 0;
        myDirectionY = 0; //holds x and y coordinates of the vector for direction of travel   
        myPointDirection = 0; //holds current direction the ship is pointing in degrees
     } 
   public void setX(int x){ myCenterX = x; }
   public int getX() { return (int)myCenterX; }
   public void setY(int y) { myCenterY = y; }
   public int getY() { return (int)myCenterY;  }
   public void setDirectionX(double x) { myDirectionX = x; }
   public double getDirectionX() { return (int)myDirectionX; }
   public void setDirectionY(double y) {  myDirectionY = y; }
   public double getDirectionY()  { return (int)myDirectionY; }
   public void setPointDirection(int degrees) { myPointDirection = degrees; }
   public double getPointDirection() { return (int)myPointDirection; }   
}
class SpaceShip extends Floater 
{   
   public SpaceShip()
     { 
        corners = 9;  //the number of corners, a triangular floater has 3   
        int[] xS = { 20, 0, 0, -3, -10, -10, -3, 0, 0 } ;   
        int[] yS = { 0, -5, -10, -5, -5, 5, 5, 10, 5 } ;  
        xCorners = xS;
        yCorners = yS; 
        myColor = color(255,0,0);   
        myCenterX = 500;
        myCenterY = 500; //holds center coordinates   
        myDirectionX = 0;
        myDirectionY = 0; //holds x and y coordinates of the vector for direction of travel   
        myPointDirection = 0; //holds current direction the ship is pointing in degrees
     } 
   public void setX(int x)
     {
        myCenterX = x;
     }
   public int getX()
     {
        return (int)myCenterX;
     }
   public void setY(int y)
     {
        myCenterY = y;
     }
   public int getY()
     {
        return (int)myCenterY;
     }
   public void setDirectionX(double x)
     {
        myDirectionX = x;
     }
   public double getDirectionX()
     {
        return (int)myDirectionX;
     }
   public void setDirectionY(double y)
     {
        myDirectionY = y;
     }
   public double getDirectionY() 
     {
        return (int)myDirectionY;  
     }
   public void setPointDirection(int degrees)
     {
        myPointDirection = degrees;
     }
   public double getPointDirection() 
     {
       return (int)myPointDirection;
     }
}
class Asteroids extends Floater
{
  int speed;
  public Asteroids()
  {
    speed = (int)(Math.random()*5)-10;
    corners = 6;  //the number of corners, a hexagon floater has 6    
    int[] xS = { 20, 10, -10, -20, -10, 10} ;   
    int[] yS = { 0, -20, -20, 0, 20, 20} ;  
    xCorners = xS;
    yCorners = yS; 
    myColor = color(100,93,93);   
    myCenterX = (int)(Math.random()*1000);
    myCenterY = (int)(Math.random()*1000); //holds center coordinates   
    myDirectionX = 0;
    myDirectionY = 0; //holds x and y coordinates of the vector for direction of travel   
    myPointDirection = 0; //holds current direction the ship is pointing in degrees
  }
  public void move()
  {
    rotate(speed);
    super.move();
  }
  public void setX(int x)
     {
        myCenterX = x;
     }
   public int getX()
     {
        return (int)myCenterX;
     }
   public void setY(int y)
     {
        myCenterY = y;
     }
   public int getY()
     {
        return (int)myCenterY;
     }
   public void setDirectionX(double x)
     {
        myDirectionX = x;
     }
   public double getDirectionX()
     {
        return (int)myDirectionX;
     }
   public void setDirectionY(double y)
     {
        myDirectionY = y;
     }
   public double getDirectionY() 
     {
        return (int)myDirectionY;  
     }
   public void setPointDirection(int degrees)
     {
        myPointDirection = degrees;
     }
   public double getPointDirection() 
     {
       return (int)myPointDirection;
     } 
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

