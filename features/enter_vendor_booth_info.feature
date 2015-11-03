Feature: Registration of a new vendor - entering booth information

Given I have filled out the contact info page 
And I am on the booth info page

Scenario: Vendor enters booth info and clicks "Submit Booth Information" button
When I have filled out my booth information
Then I should see the services info page

Scenario: Vendor needs to enter custom booth info
When I have visited the "Custom Outdoor Space" link
Then I should see the custom booth info page