Feature: generateToken

@Awal
Scenario:
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    When request {"username": "supervisor", "password": "tek_supervisor"}
    * method post 
    * status 200
    * print response