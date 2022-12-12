Feature: post multiple value

  @multi
  Scenario Outline: 
    * url "https://tek-retail-api.azurewebsites.net"
    * def tokenFile = call read("Generate.feature")
    * def Token = tokenFile.response.accessToken
    * header x-access-token = Token
    * path "/payment"
    * request
      """
      {
        "cardNumber": '<CardNumValue>',
        "nameOnCard": '<CardName>',
        "expirationMonth": <ExpirationMonthValue>,
        "expirationYear": <expirationYearValue>,
        "securityCode": '<securityCodeValue>'
      }
      """
    * method post
    * status 200
    * print response

    Examples: 
      | CardNumValue     | CardName  | ExpirationMonthValue | expirationYearValue | securityCodeValue |
      | 1234564800987654 | fariJanMa |                    2 |                2030 |               202 |
      | 5234565800987654 | fariJanMa |                    2 |                2030 |               202 |
      | 6234566800987654 | fariJanMa |                    2 |                2030 |               202 |
      | 7234567800987654 | fariJanMa |                    2 |                2030 |               202 |
      | 8234568800987654 | fariJanMa |                    2 |                2030 |               202 |
