package Retail.Api.Test;

import com.github.javafaker.Faker;

public class RandomClass {
	static Faker fake = new Faker();
	
	public static String getEmail() {
	
	String email = fake.name().firstName()+fake.name().lastName()+"@tekschool.us";
	return email;
	}

	public static String getName() {
	String name = fake.name().firstName();
	return name;
	}
	
	public static String getLastName() {
		String lastName= fake.name().lastName();
		return lastName;
	}
	
	
}
