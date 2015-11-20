Feature: Allow Vendor to Sign Up

# This is Happy Path!
Scenario:  Create a new Vendor Account (Declarative)
  When I have added a vendor with user name "yusufsermet", password "samplePass", and e-mail "yusuf@sermet.com"
  And I am on the Login page  
  Then I should see a message "New user yusufsermet was successfully created."

# Username Mistakes:

Scenario:  Create a new Vendor Account with Taken Username (Sad Path)
  Given I have added a vendor with user name "yusufsermet", password "samplePass", and e-mail "yusuf@sermet.com"
  When I have visited Signup Page
  Given I have added a vendor with user name "yusufsermet", password "samplePass", and e-mail "yusuf@sermet.com"
  And I am on the Signup page  
  Then I should see a message "User name has already been taken"

Scenario:  Create a new Vendor Account with Empty Username (Sad Path)
  When I have added a vendor with user name "", password "samplePass", and e-mail "yusuf@sermet.com"
  And I am on the Signup page  
  Then I should see a message "User name field cannot be left blank"
  
# End of Email Mistakes


# Password Mistakes:

Scenario:  Create a new Vendor Account with Invalid Password (Sad Path)
  When I have added a vendor with user name "yusufsermet", password "short", and e-mail "yusuf@sermet.com"
  And I am on the Signup page  
  Then I should see a message "Password is too short"

Scenario:  Create a new Vendor Account with Empty Password (Sad Path)
  When I have added a vendor with user name "yusufsermet", password "", and e-mail "yusuf@sermet.com"
  And I am on the Signup page  
  Then I should see a message "Password field cannot be left blank"
  
# End of Password Mistakes
  
  
# Email Mistakes:

Scenario:  Create a new Vendor Account with Invalid Email (Sad Path)
  When I have added a vendor with user name "yusufsermet", password "samplePass", and e-mail "yusufsermet.com"
  And I am on the Signup page  
  Then I should see a message "Email is not in correct format"

Scenario:  Create a new Vendor Account with Empty Email (Sad Path)
  When I have added a vendor with user name "yusufsermet", password "samplePass", and e-mail ""
  And I am on the Signup page  
  Then I should see a message "Email field cannot be left blank"
  
# End of Email Mistakes


