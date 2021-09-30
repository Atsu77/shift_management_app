require 'faker'

FactoryBot.define do
  factory :student do
    name { 'Jon' }
    email { 'kamnknon@icloud.com' }
    gender { 1 }
    address { 'Osaka' }
    number { '090-8888-8888' }
  end

  trait :student_for_validate do
    name { Faker::Name.name }
    sequence(:email) { |n| "student#{n}@example.com" }
  end


end
