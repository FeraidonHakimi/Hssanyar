Feature: 


	
  Scenario: 
    * def body =
      """
      {
        "helo": {
          "title": "Electronics",
          "level": 1,
          "id": 1,
          "children": [
            {
              "id": 6,
              "title": "TV & Video"
            },
            {
              "id": 7,
              "title": "Video Games"
            }
          ]
        },
       
        "1": {
          "title": "Sports",
          "level": 1,
          "id": 4,
          "children": [
            {
              "id": 12,
              "title": "Athletic Clothing"
            },
            {
              "id": 13,
              "title": "Exercise & Fitness"
            }
          ]
        }
      }
      """
      * print '*************************************************************************'
   	  * print body.helo
      * print body[1]
      * print body[1].id
      * print body[1].children
      * print body[1].children[1]
      * print body[1].children[1].title
     
