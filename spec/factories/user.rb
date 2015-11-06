FactoryGirl.define do
  factory :user do
    email 'testemail@testing.com' # default values
    password 'testingtesting123'
    role "vendor"
  end
end