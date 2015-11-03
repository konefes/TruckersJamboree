# Place all tests on views here

Given /^I am on the home page$/ do
  visit show_vendor_path
 end

Then /^I should see all of the vendors$/ do
  Vendor.all
end



