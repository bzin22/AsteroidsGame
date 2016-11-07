// AsteroidsGame - Bryan Zin - AP Computer Science Fall 2016
boolean gameOver = false;
SpaceShip voyager = new SpaceShip();
Stars [] galaxy = new Stars[200];
Rockets booster = new Rockets();
ArrayList <Asteroids> rocks = new ArrayList <Asteroids>();
ArrayList <Phasers> bullet = new ArrayList <Phasers>();
ArrayList <Destruction> ofSpaceship = new ArrayList <Destruction>();

int myVariable; // used for setting the hyperspace variable to one common number
public void setup() 
  {
    size(1000, 1000);
    for (int i = 0; i < galaxy.length; i++) 
    {
        galaxy[i] = new Stars();   
    }
   
    for (int j = 0; j < 20; j++) 
    {
      rocks.add(new Asteroids());
    }
  }
public void draw() 
  {
    if (gameOver == false)
    {
      background(0);
      for (int a = 0; a < ofSpaceship.size(); a++) 
      {
        ofSpaceship.get(a).move();
        ofSpaceship.get(a).show();
      }
      for (int l = 0; l < bullet.size(); l++) // shows & moves the phasers when hitting spacebar
       {
         bullet.get(l).move();
         bullet.get(l).show();
       }
      for (int i = 0; i < galaxy.length; i++) // shows stars 
      {
         galaxy[i].show();
      }
      for (int j = 0; j < rocks.size(); j++) // shows and moves asteroids
      {
          rocks.get(j).show();   
          rocks.get(j).move();
      }
      if (key == 's') // shows rocket booster whenever the ship acclerates
      {
        booster.show();
      }
      booster.move();
      voyager.show();
      voyager.move();
      
      // checking for collisions
      
      for (int i = 0; i < rocks.size(); i++) 
      {
        for (int k = 0; k < bullet.size(); k++) 
        {
          if ( dist( bullet.get(k).getX(), bullet.get(k).getY(), rocks.get(i).getX(), rocks.get(i).getY() ) <= 25) 
          {
            rocks.remove(i);
            bullet.remove(k);
            break;
          }
        }

        if ( dist( voyager.getX(), voyager.getY(), rocks.get(i).getX(), rocks.get(i).getY() ) <= 25 )
        {
          // animation of destruction
          voyager.setColor(0);
          booster.setColor(0);
          ofSpaceship.add(new Destruction(voyager));
          gameOver = true;
        } 
      }
    }
    if (gameOver == true)
    {
      background(255,255,255);
       textSize(40);
       text("BOOM!!!", 400, 500);
       text("YOUR SHIP WAS DESTROYED.", 200, 550);
       text("Please Refresh your screen to continue.", 200, 600);
    }
  }
public void keyPressed() 
   {
     if (key == ' ') // shoot phasers
     {
       bullet.add(new Phasers(voyager));
     }
     if (key == 'a') // rotate counterclockwise
     {
        voyager.rotate(-30); 
        booster.rotate(-30); 
     }
     if (key == 'd')// rotate clockwise
     {
        voyager.rotate(30);
        booster.rotate(30);
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
class Destruction extends Floater // destruction of ship when it hits asteroid
{
  public Destruction(SpaceShip aShip)
   { 
      corners = 5;  // draws fragments  
      int[] xS = { -9, -6, 0, 6, 0 } ;   
      int[] yS = { 0, 9, 6, 6, 0} ;  
      xCorners = xS;
      yCorners = yS; 
      myColor = color(203,88,88);   
      myCenterX = aShip.getX();
      myCenterY = aShip.getY(); //holds center coordinates   
      myDirectionX = (int)(Math.random()*5);
      myDirectionY = (int)(Math.random()*5); //holds x and y coordinates of the vector for direction of travel   
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

   public void move()
   {
      super.move();
   }
}
class Stars // background
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
class Phasers extends Floater
{
  private double dRadians;
  private int nDegreesOfRotation;
  public Phasers(SpaceShip theShip)
  {
    myColor = color(0,255,0);   
    myCenterX = theShip.getX();
    myCenterY = theShip.getY(); //holds center coordinates   
    myPointDirection = theShip.getPointDirection(); //holds current direction the ship is pointing in degrees
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY(); //holds x and y coordinates of the vector for direction of travel   
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
  
  public void move()
  {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
  }
  public void show()
  {
    noStroke();
    fill(0,255,0);
    ellipse( (int)myCenterX, (int)myCenterY, 5, 5);
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
  public void setColor(int c)
  {
    myColor = color(c,c,c);
  }
  public int getColor()
  {
    return (int)myColor;
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
    public void setColor(int c)
    {
      myColor = color(c,c,c);
    }
    public int getColor()
    {
      return (int)myColor;
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
    corners = 6;  // the number of corners, a hexagon floater has 6    
    int[] xS = { 20, 10, -10, -20, -10, 10} ;   
    int[] yS = { 0, -20, -20, 0, 20, 20} ;  
    xCorners = xS;
    yCorners = yS; 
    myColor = color(100,93,93);   
    myCenterX = (int)(Math.random()*1000);
    myCenterY = (int)(Math.random()*1000); //holds center coordinates   
    myDirectionX = (int)(Math.random()*2);
    myDirectionY = (int)(Math.random()*2); //holds x and y coordinates of the vector for direction of travel   
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
abstract class Floater // Do NOT modify the Floater class! Make changes in the SpaceShip class 
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

