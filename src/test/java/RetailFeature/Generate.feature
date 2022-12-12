Feature: Generate token

	@token
  Scenario: 
    When url "https://tek-retail-api.azurewebsites.net"
    * path "/auth/login"
    * request {"email": "farifari@gmail.com","password": "Qwerty@2"}
    * method post
    * status 200
    * print response
		