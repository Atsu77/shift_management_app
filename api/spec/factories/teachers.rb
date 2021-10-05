require 'faker'

FactoryBot.define do
  factory :teacher do
    name { 'Quill' }
    email { 'kamnknon@gmail.com' }
    gender { 1 }
    address { 'Tokyo' }
    number { '090-9999-9999' }
    profile { 'aaaaaaaaaaaaa' }
  end

  trait :for_validate do
    name { Faker::Name.name }
    sequence(:email) { |n| "tester#{n}@example.com" }
  end

end
