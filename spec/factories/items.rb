FactoryBot.define do
  factory :item do
    name                        {"テスト"}
    explain                     {"テストの説明文を記述する。"}
    category_id                 {2}
    item_status_id              {2}
    shipping_fee_status_id      {2}
    shipping_fee_destination_id {2}
    shipping_fee_day_id         {2}
    cost                        {999}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
