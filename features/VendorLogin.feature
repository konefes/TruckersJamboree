Feature: Allow Vendor to Login

# This is Happy Path!
Scenario:  Vendor logs in to his/her account (Declarative)
  Given I have added a vendor with user name "yusufsermet", password "samplePass", and e-mail "yusuf@sermet.com"
  When I have visited Login Page 
  And I have logged in with user name "yusufsermet", password "samplePass"
  Then I should see a message "You are logged in as yusufsermet"


