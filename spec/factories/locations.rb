# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    street "MyString"
    city "MyString"
    state "MyString"
    country "MyString"
    zip "MyString"
    address "MyString"
  end
end
