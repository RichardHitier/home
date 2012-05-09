/**
 * 
 */
package tests;

import hello.*;
import junit.framework.TestCase;

/**
 * @author richard
 *
 */
public class HelloMakerTest extends TestCase {
	private HelloMaker myHelloMaker = null;
	/**
	 * @param name
	 */
	public HelloMakerTest(String name) {
		super(name);
	}

	/* (non-Javadoc)
	 * @see junit.framework.TestCase#setUp()
	 */
	protected void setUp() throws Exception {
		super.setUp();
		myHelloMaker = new HelloMaker();
	}

	/* (non-Javadoc)
	 * @see junit.framework.TestCase#tearDown()
	 */
	protected void tearDown() throws Exception {
		super.tearDown();
	}

	/**
	 * Test method for {@link HelloMaker#showHello()}.
	 */
	public void testShowHello() {
		assertTrue(myHelloMaker.showHello() instanceof String );
	}

}
