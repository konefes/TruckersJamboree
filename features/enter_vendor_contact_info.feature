Feature: Registration of a new vendor - entering contact information
  
Scenario: Vendor enters contact info and clicks "Submit Contact Information" button

Given I am on the contact info page
When I have filled out my information with:
    | field             | info              |
    | company_name      | company1          |
    | product           | product1          |
    | contact_name      | name1             |
    | address_street    | 123 a st.         |
    | address_city      | city1             |
    | address_state     | Alabama           |
    | address_zip       | 11111             |
    | phone             | 1231231234        |
    | fax               | 1231231234        |
    | email             | test@test.com     |
    | submit            | Submit Contact Information|

Then I should see the booth info page