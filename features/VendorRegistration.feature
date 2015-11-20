Feature: Registration of a new vendor 
  
Scenario: Vendor goes through normal registration
    Given I am on the contact info page
    When I have filled out my information with:
        | field             | info              |
        | company_name      | company1          |
        | product           | product1          |
        | contact_name      | name1             |
        | contact_title     | title1            |
        | address_street    | 123 a st.         |
        | address_city      | city1             |
        | address_state     | Alabama           |
        | address_zip       | 11111             |
        | phone             | 1231231234        |
        | email             | test@test.com     |
        | submit            | Submit Contact Information|
    And I have filled out my information with:
        | field             | info              |
        | number_i_booth    | 2                 |
        | number_o_booth    | 3                 |
        | submit            | Submit Booth Information|
    And I have filled out my information with:
        | field             | info              |
        | electric          | 1                 |
        | ext_chairs        | 5                 |
        | ext_tables        | 3                 |
        | service_description | description1    |
        | submit            | Submit Service Information|
    Then I should see the summary page with "company1", "product1"


Scenario: Vendor goes through registration with custom booth info
    Given I am on the contact info page
    When I have filled out my information with:
        | field             | info              |
        | company_name      | company1          |
        | product           | product1          |
        | contact_name      | name1             |
        | contact_title     | title1            |
        | address_street    | 123 a st.         |
        | address_city      | city1             |
        | address_state     | Alabama           |
        | address_zip       | 11111             |
        | phone             | 1231231234        |
        | email             | test@test.com     |
        | submit            | Submit Contact Information|
    And I have opted to use custom booth information
    And I have filled out my information with:
        | field             | info              |
        | trailer_select    | Tractor only w/ table and two chairs 15x40 |
        | width             | 30                |
        | length            | 25                |
        | custom_description| description1      |
        | submit            | Submit Booth Information|
    And I have filled out my information with:
        | field             | info              |
        | electric          | 1                 |
        | ext_chairs        | 5                 |
        | ext_tables        | 3                 |
        | service_description | description1    |
        | submit            | Submit Service Information|
    Then I should see the summary page with "company1", "product1"