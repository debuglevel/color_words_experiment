public abstract class Picker
{
  private int x;
  private int y;
  private int width;
  private int height;

  public PickIndicator pickIndicator = new PickIndicator(this);

  public PGraphics image;

  public Picker(int x, int y, int width, int height)
  {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;

    this.pickIndicator.setOffset(x, y);
  }

  public void setup()
  {
    this.image = createGraphics(this.width, this.height);
  }

  public void display()
  {
    this.displayScale();
    this.pickIndicator.display();
  }

  public abstract void draw();

  private void displayScale()
  {
    image(this.image, this.getStartX(), this.getStartY());
  }

  public boolean isInRange(float absoluteX, float absoluteY)
  {
    //println("Picker.IsInRange (absoluteX = " + absoluteX + " absoluteY = " + absoluteY + ")");

    boolean val = (absoluteY >= this.getStartY() &&
      absoluteY <= this.getEndY() &&
      absoluteX >= this.getStartX() &&
      absoluteX <= this.getEndX());

    //println("Picker.IsInRange: " + val);

    return val;
  }

  public int getStartX()
  {
    return this.x;
  }

  public int getStartY()
  {
    return this.y;
  }

  public int getWidth()
  {
    return this.width;
  }

  public int getHeight()
  {
    return this.height;
  }

  public int getEndX()
  {
    return this.x + this.width;
  }

  public int getEndY()
  {
    return this.y + this.height;
  }
}

