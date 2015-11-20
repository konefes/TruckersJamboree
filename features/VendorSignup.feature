Feature: Allow Vendor to Sign Up

Scenario:  Create a new Vendor Account (Declarative)
  When I have added a vendor with user name "yusufsermet", password "samplePass", and e-mail "yusuf@sermet.com"
  And I am on the Login page  
  Then I should see a message "New user yusufsermet was successfully created."

