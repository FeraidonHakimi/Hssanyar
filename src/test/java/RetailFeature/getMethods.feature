Feature: getMethods

  @getCategory
  Scenario: get Category
    * url "https://tek-retail-api.azurewebsites.net"
    * def tokenFile = call read("Generate.feature")
    * def tokenValue = tokenFile.response.accessToken
    * header Authorization = "Bearer "+tokenValue
    * path "/category"
    * method get
    * status 200
    * print response
	
	@getPayment
	Scenario: 
	* url "https://tek-retail-api.azurewebsites.net"
	* def tokenFile = call read("Generate.feature")
	* def tokenValue = tokenFile.response.accessToken
	* header x-access-token = tokenValue
	* path "/payment"
	* method get
	* status 200
	* print response

	@getOrder
	Scenario: 
	When url "https://tek-retail-api.azurewebsites.net"
	* def tokenFile = call read("Generate.feature")
	* def token = tokenFile.response.accessToken
	* header x-access-token = token
	* path "/order"
	* method get
	* status 200
	* print response
	
	