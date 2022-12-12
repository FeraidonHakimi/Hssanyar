Feature: End to End testing Api
		
		@EndTOEndTry
		Scenario: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * path "api/accounts/add-primary-account"
		* def generator = Java.type("api.test.DataGenerator")
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def birthDay = generator.getDob()
    * def title = generator.getTitle()
    * request
      """
      {
      "email":"#(email)",
      "firstName":"#(firstName)",
      "lastName":"#(lastName)",
      "title":"#(title)",
      "gender":"MALE",
      "maritalStatus":"SINGLE",
      "employmentStatus":"Student",
      "dateOfBirth": "#(birthDay)"
      }
      """
    * method post
    * status 201
    * print response
    * def dbresult = Java.type("api.test.DatabaseConnectionUtility")
    # Validate the request Vs DataBase
    * def dbEmail = dbresult.result("select * from primary_person where id = "+response.id,"email")
    * match dbEmail == email
    * print dbEmail
    * def FName = dbresult.result("select * from primary_person where id = "+response.id,"first_name")
    * match FName == firstName
    * def Lname = dbresult.result("select * from primary_person where id = "+response.id,"last_name")
    * match Lname == lastName
    * def mstatus = dbresult.result("select * from primary_person where id = "+response.id,"marital_status")
    * match mstatus == 'SINGLE'
    * def emStatus = dbresult.result("select * from primary_person where id = "+response.id,"employment_status")
    * match emStatus == 'Student'
    * def ggender = dbresult.result("select * from primary_person where id = "+response.id,"gender")
    * match ggender == 'MALE'
    * def ttitle = dbresult.result("select * from primary_person where id = "+response.id,"title")
    * match ttitle == title
    * def DOB = dbresult.result("select * from primary_person where id = "+response.id,"date_of_birth")
    * match DOB contains birthDay
    # Validate the response Vs DataBase
    * match response.firstName == FName
    * match response.lastName == Lname
    * match response.maritalStatus == mstatus
    # Validate the reponse vs request
    * match response.title == ttitle
    * match response.gender == ggender
    #* match response.dateOfBirth contains DOB
    
    
    
    
    
    
    
    
    
    
    		@secondTry
    		Scenario: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * path "api/accounts/add-primary-account"
		* def generator = Java.type("api.test.DataGenerator")
    * def emailValue = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def birthDay = generator.getDob()
    * def title = generator.getTitle()
    * request
      """
      {
      "email":"#(emailValue)",
      "firstName":"#(firstName)",
      "lastName":"#(lastName)",
      "title":"#(title)",
      "gender":"MALE",
      "maritalStatus":"SINGLE",
      "employmentStatus":"Student",
      "dateOfBirth": "#(birthDay)"
      }
      """
    * method post
    * status 201
    * print response
    * def dbresult = Java.type("api.test.DatabaseConnectionUtility")
    * def EmailValue = dbresult.result("select * from primary_person where email = '"+ emailValue+"'","email")
    * match EmailValue == emailValue
    * def EmailValue = dbresult.result("select * from primary_person where email = '"+ response.email+"'","email")
    * match EmailValue == emailValue
    * def nameValue = dbresult.result("select * from primary_person where first_name = '"+ response.firstName+"'","first_name")
    * match nameValue == firstName
 		
   
    
    

    