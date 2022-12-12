Feature: test

 
  Scenario: get Category
    * def aaa =
      """
      {
      "menu": {  
      "id": "file",  
      "value": "File",  
      "popup": {  
      "menuitem": [  
        {"value": "New", "onclick": "CreateDoc()"},  
        {"value": "Open", "onclick": "OpenDoc()"},  
        {"value": "Save", "onclick": "SaveDoc()"}  
      ]  
      }  
      }}  

      """
     # * print aaa
     # * print aaa.id
     # * print aaa.menu
      * print aaa.menu.popup
      * print aaa.menu.popup.menuitem[1]
      * print aaa.menu.popup.menuitem[0].onclick
      
