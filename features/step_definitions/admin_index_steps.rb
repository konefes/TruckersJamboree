# Place all tests on admin index **requires db:seed

Given /^I am on the admins index page$/ do
  visit admins_path
 end

Then /^I should see the vendor name "(.*?)"$/ do |arg|
  page.has_content?(arg)
end

# Most admin index functionality is javascript and tested with jasmine