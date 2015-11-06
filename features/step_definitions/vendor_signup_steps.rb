
When(/^I have added a vendor with user name "(.*?)", password "(.*?)", and e-mail "(.*?)"$/) do |username, password, email|
  visit new_user_path
  fill_in 'user[username]', :with => username
  fill_in 'user[password]', :with => password
  fill_in 'user[email]', :with => email
  select "Vendor", :from => 'User Type'
  click_button 'Create my account'
end

And(/^I am on the Login page$/) do
  expect(page).to have_button("Login to my account")
end

Then(/^I should see a message "(.*?)"$/) do |confirmationMessage|
  expect(page).to have_content(confirmationMessage)
end