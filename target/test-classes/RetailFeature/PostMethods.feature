Feature: 



  @Postpayment
  Scenario: 
    * url "https://tek-retail-api.azurewebsites.net"
    * def tokenFile = call read("Generate.feature")
    * def Token = tokenFile.response.accessToken
    * header x-access-token = Token
    * path "/payment"
    * request
      """
      {
        "cardNumber": "0073020012233243",
        "nameOnCard": "ali Krasinsky",
        "expirationMonth": 12,
        "expirationYear": 2029,
        "securityCode": "701"
      }
      """
    * method post
    * status 200
    * print response

  @PostAddress
  Scenario: 
    * url "https://tek-retail-api.azurewebsites.net"
    * def randomClass = Java.type("Retail.Api.Test.RandomClass")
    * def name = randomClass.getName(); 
    * def tokenFile = call read("Generate.feature")
    * def Token = tokenFile.response.accessToken
    * header x-access-token = Token
    * path "/address"
    * request
      """
      {
      "country": "United States",
      "fullName": "#(name)",
      "phoneNumber": "0787931984",
      "street": "8642 Yule Street, Arvada CO",
      "apartment": "H.no 15",
      "city": "New York",
      "state": "Idaho",
      "zipCode": "30012"
      }
      """
    * method post
    * status 200
    * print response

  @PostOrder
  Scenario: 
    * url "https://tek-retail-api.azurewebsites.net"
    * def tokenFile = call read("Generate.feature")
    * def Token = tokenFile.response.accessToken
    * header x-access-token = Token
    * path "/order"
    * request
      """
      {
      "addressId": 1251,
      "paymentId": 1451,
      "products": [
      {
      "productId": 6,
      "quantity": 5
      }
      ]
      }
      """
    * method post
    * status 200
    * print response
    
    
			@CancelOrder    
      Scenario: 
    * url "https://tek-retail-api.azurewebsites.net"
    * def tokenFile = call read("Generate.feature")
    * def Token = tokenFile.response.accessToken
    * header x-access-token = Token
    * path "/order/cancel/737"
    * method post
    * status 200
    * print response
    
    
    	 @BuyAgian
       Scenario: 
    * url "https://tek-retail-api.azurewebsites.net"
    * def tokenFile = call read("Generate.feature")
    * def Token = tokenFile.response.accessToken
    * header x-access-token = Token
    * path "/order/buy-again/737"
    * request {"addressId": 1251,"paymentId": 1451}
    * method post
    * status 200
    * print response
    
    
    	 @Return
       Scenario: 
    * url "https://tek-retail-api.azurewebsites.net"
    * def tokenFile = call read("Generate.feature")
    * def Token = tokenFile.response.accessToken
    * header x-access-token = Token
    * path "/order/buy-again/737"
    * request {"reason": "wrong","dropoff": "usps","productIds": [744]}
    * method post
    * status 200
    * print response
    
    
