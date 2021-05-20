FactoryBot.define do
  factory :item do
    name {'テスト'}
    explanation {'テスト'}
    category_id {'2'}
    condition_id {'2'}
    postage_id {'2'}
    area_id {'2'}
    delivery_id {'2'}
    price {'10000'}
    image {Faker::Lorem.sentence}
    association :user 
  end
end
