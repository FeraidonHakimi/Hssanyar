Feature: Post Request Tests
  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * path "api/accounts/add-primary-account"
  Scenario: Verify Post Request Method
    * request
      """
      {
      "email":"karateCall@tekschool.com",
      "firstName":"Panthers",
      "lastName":"TEK",
      "title":"MR",
      "gender":"MALE",
      "maritalStatus":"SINGLE",
      "employmentStatus":"Student",
      "dateOfBirth": "1990-01-20"
      }
      """
    * method post
    * status 201
    * print response
  @postCall
  Scenario: post Request with Faker data
    #first we need to define a variable to read the java class
    #second we need to define a variable to call each static method from that class
    * def generator = Java.type("api.test.DataGenerator")
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * request
      """
      {
      "email":"#(email)",
      "firstName":"#(firstName)",
      "lastName":"#(lastName)",
      "title":"MR",
      "gender":"MALE",
      "maritalStatus":"SINGLE",
      "employmentStatus":"Student",
      "dateOfBirth": "1990-01-20"
      }
      """
    * method post
    * status 201
    * print response
    
    