Feature: 

  @getPayment
  Scenario: 
    # note: this file designed only for two cards already added
    * url "https://tek-retail-api.azurewebsites.net"
    * def tokenFile = call read("Generate.feature")
    * def tokenValue = tokenFile.response.accessToken
    * header x-access-token = tokenValue
    * path "/payment"
    * method get
    * status 200
    * match response ==
      """
      [
      {
       "id": '#number',
         "cardNumber": '#string',
         "nameOnCard": '#string',
         "expirationMonth": '#number',
         "expirationYear": '#number',
         "securityCode": '#number',
         "userId": '#number',
         "isDeleted": '#boolean',
         "createdAt": '#string',
         "updatedAt": '#string'
      
      }, 
       {
       "id": '#number',
         "cardNumber": '#string',
         "nameOnCard": '#string',
         "expirationMonth": '#number',
         "expirationYear": '#number',
         "securityCode": '#number',
         "userId": '#number',
         "isDeleted": '#boolean',
         "createdAt": '#string',
         "updatedAt": '#string'
      
      }
      ]
      """

  # single object will be in the form of map {} / jason body
  # multiple object will be in form of list [] / aray
  
  @CancelOrderSchemaValidation
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
    * match response ==
      """
      {
      "id": '#number',
      "number": "#string",
      "date": "#string",
      "price": "#number",
      "quantity": "#number",
      "deliverDate": "#string",
      "status": "#number",
      "cardNumber": "#string",
      "country": "#string",
      "fullName": "#string",
      "phoneNumber": "#string",
      "street": "#string",
      "apartment": "#string",
      "city": "#string",
      "state": "#string",
      "zipCode": "#number",
      "products": [
      {
      "descriptiveName": "#string",
      "name": "#string",
      "imageUrl": "#string",
      "id": "#number",
      "quantity": "#number",
      "price": "#number"
      }
      ]
      }
      """
