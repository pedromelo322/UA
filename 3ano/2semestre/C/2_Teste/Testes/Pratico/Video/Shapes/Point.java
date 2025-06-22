public class Point {

    public Point(double x, double y) {
    this.x = x;
    this.y = y;

    }

    public double x() { return x; }
    public double y() { return y; }

    public double distanceTo(Point other) {
    assert other != null;
    return Math.sqrt((x-other.x)*(x-other.x)+(y-other.y)*(y-other.y));

    }

    private double x,y;

}
