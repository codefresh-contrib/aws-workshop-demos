package sample.actuator;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class HelloWorldServiceTest {

	@Test
	public void expectedMessage() {
		HelloWorldService helloWorldService = new HelloWorldService();
		assertTrue("Expected correct message",helloWorldService.getHelloMessage().contains("Spring"));
	}
	
}
