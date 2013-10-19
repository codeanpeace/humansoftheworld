# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    name "MyString"
    id "MyString"
    description "MyText"
    about "MyText"
    talking_about_count ""
    link "MyString"
    likes ""
    cover_source "MyString"
    location nil
  end
end
