package api
.test;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	
	
	@Karate.Test
	Karate testUsers() {
		return Karate.run("classpath:features").tags("@secondTry");
	}

}
