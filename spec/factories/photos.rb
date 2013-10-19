# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    id "MyString"
    created_time "MyString"
    likes_count "MyString"
    picture "MyString"
    link "MyString"
    latitude 1.5
    longitude 1.5
    page nil
  end
end
