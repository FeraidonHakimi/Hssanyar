Feature: End to End Testing

  Background: 
    * url "https://tek-retail-api.azurewebsites.net"
    * def tokenFile = call read("Generate.feature")
    * def Token = tokenFile.response.accessToken
  Scenario: 
    #* url "https://tek-retail-api.azurewebsites.net"
    #* def tokenFile = call read("Generate.feature")
    #* def Token = tokenFile.response.accessToken
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
    * print "*********************************************************"
    * status 200
    * def idValue = response.id
    * print response
    #* url "https://tek-retail-api.azurewebsites.net"
    #* def tokenFile = call read("Generate.feature")
    #* def Token = tokenFile.response.accessToken
    * header x-access-token = Token
    * path "/order/cancel/"+idValue
    * method post
    * status 200
    * print response
    * print "*********************************************************"
    #* url "https://tek-retail-api.azurewebsites.net"
    # * def tokenFile = call read("Generate.feature")
    # * def Token = tokenFile.response.accessToken
    * header x-access-token = Token
    * path "/order/buy-again/"+idValue
    * request {"addressId": 1251,"paymentId": 1451}
    * method post
    * print "*********************************************************"
    * status 200
    * print response

  @save
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
    * print "*********************************************************"
    * status 200
    * def idValue = response.id
    * print response
    * url "https://tek-retail-api.azurewebsites.net"
    * def tokenFile = call read("Generate.feature")
    * def Token = tokenFile.response.accessToken
    * header x-access-token = Token
    * path "/order/cancel/"+idValue
    * method post
    * status 200
    * print response
    * print "*********************************************************"
    * url "https://tek-retail-api.azurewebsites.net"
    * def tokenFile = call read("Generate.feature")
    * def Token = tokenFile.response.accessToken
    * header x-access-token = Token
    * path "/order/buy-again/"+idValue
    * request {"addressId": 1251,"paymentId": 1451}
    * method post
    * print "*********************************************************"
    * status 200
    * print response
