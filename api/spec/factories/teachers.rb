FactoryBot.define do
  factory :teacher do
    name 'Quill'
    sequence(:email) { |n| "sample#{n}@example.com" }
    password_digest "password"
    gender 'male'
    address 'Tokyo'
    number '090-9999-9999'
    profile 'aaaaaaaaaaaaa'
  end
end
