FactoryBot.define do
  factory :item do
    name             {'手すト'}
    description      {'商品の説明は〜です。'}
    category_id      {2}
    condition_id     {2}
    delivery_fee_id  {2}
    prefecture_id    {2}
    days_to_ship_id  {2}
    price            {999}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
