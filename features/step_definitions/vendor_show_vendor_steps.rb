# Place all tests on views here

Given /^I am on the vendors page$/ do
  visit vendors_index_path
 end

When(/^I have clicked "(.*?)" link$/) do |arg1|
  click_on "show all vendors"
end

Then /^I should see "(.*?)"$/ do |arg2|
  page.has_content?(arg2)
end

