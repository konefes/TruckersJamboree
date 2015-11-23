# Place all tests on admin index **requires db:seed

Given /^I am on the admins index page$/ do
  visit admins_path
 end

Then /^I should see the vendor name "(.*?)"$/ do |arg|
  page.has_content?(arg)
end

When /^I click on the vendor name "(.*?)"$/ do |arg|
  page.click_link(arg)
end

Then /^I should see the individual vendor info for "(.*?)"$/ do |arg|
  page.has_content?("Vendor Information")
end