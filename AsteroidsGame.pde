
SpaceShip voyager = new SpaceShip();
Stars [] galaxy = new Stars[200];

public void setup() 
  {
    size(1000, 1000);
  }
public void draw() 
  {
    background(0);
    for (int i = 0; i < galaxy.length; i++) 
    {
        galaxy[i] = new Stars();   
        galaxy[i].show();
    }
    voyager.show();
    voyager.move();
  }
public void keyPressed() 
   {
     if (key == 'a') 
     {
        voyager.rotate(-12);  
     }
     if (key == 'd')
     {
        voyager.rotate(12);
     }
     if (key == 's') 
     {
        voyager.accelerate(2);
     }
     if (key == 'w') 
     {
        voyager.setDirectionX(0);
        voyager.setDirectionY(0);
     }
     if (key == 'q') 
      {
          voyager.setY((int)Math.random()*500);
          voyager.setX((int)Math.random()*500);
          System.out.println("happy");
      }
   }
class Stars
{
  private int radius, colors;
  public Stars()
  {
    radius = (int)(Math.random()*15);
    colors = (int)(Math.random()*255);
  }
  public void show()
  {
      fill(colors,colors,colors);
      noStroke();
      ellipse( (int)(Math.random()*1000), (int)(Math.random()*1000), radius, radius);
  }
}
class SpaceShip extends Floater 
{   
   public SpaceShip()
     { 
        corners = 4;  //the number of corners, a triangular floater has 3   
        int[] xS = { 10, -20, -15, -20} ;   
        int[] yS = { 0, 10, 0, -10} ;  
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

