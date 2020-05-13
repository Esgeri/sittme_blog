FactoryBot.define do
  factory :article do
    title { 'TestTitle' }
    description { 'TestDescription' }

    association :user
  end

  factory :invalid_article, class: 'Article' do
    title { 'TestTitle' }
    description { nil }

    association :user
  end
end
