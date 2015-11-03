# Place all tests on views here

Given /^I am on the Vendors home page$/ do
  visit vendors_index_path
 end

When(/^I clicked "(.*?)" link$/) do |arg1|
  click_on "show all vendors"
end

Then /^I should see all of the vendors$/ do
  Vendor.all
end



