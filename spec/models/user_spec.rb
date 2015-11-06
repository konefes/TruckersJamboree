require 'rails_helper'

RSpec.describe User, type: :model do
    it "should include email, password, and role" do
      user = FactoryGirl.build(:user, :email => 'testing@testing.com', :role => 'vendor')
      expect(user.email_with_role).to eq('testing@testing.com (vendor)')
    end
end
