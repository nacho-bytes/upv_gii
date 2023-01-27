

import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * The test class Testing.
 *
 * @author  (your name)
 * @version (a version number or a date)
 */
public class Testing
{
    /**
     * Default constructor for test class Testing
     */
    public Testing()
    {
    }

    @Test
    public void testEqualsCuadrado() 
    {
        Rectangle r1 = new Rectangle(0,0,1,2);
        Rectangle r2 = new Rectangle(1,1,1,2);
        Rectangle r3 = new Rectangle(1,1,1,3);        
        FiguresGroup gf = new FiguresGroup();
        assertEquals(r1.equals(r1), true);
        assertEquals(r1.equals(r2), false);
        assertEquals(r1.equals(r3), false);        
        assertEquals(r1.equals(gf), false);
    }

    @Test
    public void testEqualsGrupoFigura() 
    {
        Rectangle r1 = new Rectangle(0,0,1,2);
        Rectangle r2 = new Rectangle(1,1,1,2);
        Rectangle r3 = new Rectangle(1,1,1,3);
        Circle c1 = new Circle(0,0,1);
        Circle c2 = new Circle(1,1,2);
        Circle c3 = new Circle(1,1,3);        
        FiguresGroup gf1 = new FiguresGroup();
        FiguresGroup gf2 = new FiguresGroup();
        FiguresGroup gf3 = new FiguresGroup();
        
        assertEquals(gf1.equals(gf2), true);        
        assertEquals(gf2.equals(gf1), true);        
        
        gf1.add(r1);

        assertEquals(gf1.equals(gf2), false);
        assertEquals(gf2.equals(gf1), false);
        
        gf2.add(r1);       
        
        assertEquals(gf1.equals(gf2), true);        
        assertEquals(gf2.equals(gf1), true);        
        
        gf1.add(r1);

        assertEquals(gf1.equals(gf2), true);        
        assertEquals(gf2.equals(gf1), true);        
        
        gf1.add(r2);

        assertEquals(gf1.equals(gf2), false);        
        assertEquals(gf2.equals(gf1), false);        
        
        gf2.add(r2);

        assertEquals(gf1.equals(gf2), true);        
        assertEquals(r3.equals(r2), false);
        assertEquals(r1.equals(r3), false);        
        assertEquals(r3.equals(gf1), false);
    }

    @Test
    public void testAreas() 
    {
        Rectangle r1 = new Rectangle(0,0,1,2);
        Triangle t1 = new Triangle(1,1,1,2);
        Circle c1 = new Circle(1,1,5);        
        
        FiguresGroup gf = new FiguresGroup();
        gf.add(r1);
        gf.add(t1);
        gf.add(c1);
        
        assertEquals(r1.area(), 2.0, 0.1);
        assertEquals(t1.area(), 1.0, 0.1);
        assertEquals(c1.area(), 78.53, 0.1);
        assertEquals(gf.area(), 81.53, 0.1);
    }

    @Test
    public void testCompareToRange() 
    {
        Rectangle r1 = new Rectangle(0,0,1,2);
        Triangle t1 = new Triangle(1,1,1,2);
        Circle c1 = new Circle(1,1,5);        
        Rectangle r2 = new Rectangle(0,0,1,1);
        Rectangle r3 = new Rectangle(0,0,2,2);
                
        assertEquals(r1.compareToRange(r1), 0);
        assertEquals(r1.compareToRange(r2), 1);
        assertEquals(r1.compareToRange(r3), -1);
        
        FiguresGroup gf = new FiguresGroup();
        gf.add(r1);
        gf.add(t1);
        gf.add(c1);
    }

    @Test
    public void testGreatestFigure() 
    {
        Rectangle r1 = new Rectangle(0,0,1,2);
        Triangle t1 = new Triangle(1,1,1,2);
        Circle c1 = new Circle(1,1,5);        
        Rectangle r2 = new Rectangle(0,0,1,1);
        Rectangle r3 = new Rectangle(0,0,2,2);

        FiguresGroup gf = new FiguresGroup();
        
        assertEquals(gf.greatestFigure(), null);

        gf.add(r1);
        
        assertEquals(gf.greatestFigure(), r1);
        
        gf.add(r3);
        
        assertEquals(gf.greatestFigure(), r3);
    }
    
    /**
     * Sets up the test fixture.
     *
     * Called before every test case method.
     */
    @Before
    public void setUp()
    {
    }

    /**
     * Tears down the test fixture.
     *
     * Called after every test case method.
     */
    @After
    public void tearDown()
    {
    }
}

