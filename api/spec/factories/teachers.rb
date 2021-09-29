FactoryBot.define do
  factory :teacher do
    name { 'Quill' }
    sequence(:email) { |n| "sample#{n}@example.com" }
    gender { 1 }
    address { 'Tokyo' }
    number { '090-9999-9999' }
    profile { 'aaaaaaaaaaaaa' }
  end
end
