Feature: Allow Vendor to Login

# This is Happy Path!
Scenario:  Vendor logs in to his/her account (Declarative) 
  Given I have added a vendor with user name "sampleUser", password "samplePass", and e-mail "test@hotmail.com"
  When I have visited Login Page 
  And I have logged in with user name "sampleUser", password "samplePass"
  Then I should see a message "You are logged in as sampleUser"


# Username Mistakes:

Scenario:  Vendor logs in to his/her account with wrong Username (Sad Path)
  Given I have added a vendor with user name "sampleUser", password "samplePass", and e-mail "test@hotmail.com"
  When I have visited Login Page 
  And I have logged in with user name "yusuf", password "samplePass"
  Then I should see a message "Invalid username/password combination"

# End of Username Mistakes


# Password Mistakes:

Scenario:  Vendor logs in to his/her account with wrong Password (Sad Path)
  Given I have added a vendor with user name "sampleUser", password "samplePass", and e-mail "test@hotmail.com"
  When I have visited Login Page 
  And I have logged in with user name "sampleUser", password "wrongPass"
  Then I should see a message "Invalid username/password combination"

# End of Username Mistakes



# This is Happy Path!
Scenario:  Vendor logs out from his/her account (Declarative)
  Given I have added a vendor with user name "sampleUser", password "samplePass", and e-mail "test@hotmail.com"
  And I have visited Login Page 
  And I have logged in with user name "sampleUser", password "samplePass"
  And I have logged out from my account
  Then I should see a message "You have logged out"

