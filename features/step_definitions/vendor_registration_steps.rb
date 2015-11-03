Given /^I am on the contact info page$/ do
    visit vendors_registration_path
end

When /I have filled out my information with:/ do |contact_info_table|
    contact_info_table.hashes.each do |info_line|
        current = page.find("##{info_line[:field]}")
        if current.tag_name == 'select'
            select info_line[:info], :from => info_line[:field]
        elsif info_line[:field] == 'submit'
            click_button info_line[:info]
        else
            fill_in info_line[:field], :with => info_line[:info] 
        end
    end
    
    
    
end