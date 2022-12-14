package api.test;

import java.util.Date;

import com.github.javafaker.Faker;
import com.ibm.icu.text.SimpleDateFormat;

public class DataGenerator {
	
	 /*
     * This class will help us to create random Data using Java Faker library
     * 1. we need to create static methods for each data type we need 
     * 2. in Karate all Java methods should be static in order to use them 
     */
    public static String getEmail() {
        Faker faker = new Faker();
        String email = faker.name().firstName()+faker.name().lastName()+"@gmail.com";
        return email;
    }
    public static String getFirstName() {
        Faker faker = new Faker();
        String firstName = faker.name().firstName();
        return firstName;
    }
    public static String getLastName() {
        Faker faker = new Faker();
        String lastName = faker.name().lastName();
        return lastName;
    }
    
   
    public static String getDob() {
        Faker faker = new Faker();
       
        Date date = faker.date().birthday();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);
    }
    public static String getTitle() {
        Faker faker = new Faker();
        String title = faker.name().title().toUpperCase();
        return title;
    }

}
