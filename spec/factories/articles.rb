FactoryBot.define do
  factory :article do
    title { 'TestTitle' }
    description { 'TestDescription' }

    association :user
  end
end
