package Retail.Api.Test;

import com.intuit.karate.junit5.Karate;


public class Runner {
	@Karate.Test
	Karate testUsers() {
		return Karate.run("classpath:RetailFeature").tags("@getCategory");
				
	}

}
