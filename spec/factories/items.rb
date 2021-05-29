FactoryBot.define do
  factory :item do
    name          {'テスト'}
    explanation   {'テスト'}
    category_id   {2}
    condition_id  {2}
    postage_id    {2}
    area_id       {2}
    delivery_id   {2}
    price         {10000}
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
    association :user 
  end
end
