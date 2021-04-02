FactoryBot.define do
  factory :purchase_order do
    user_id                     {1}
    item_id                     {1}
    post_code                   {'123-4567'}
    shipping_fee_destination_id {2}
    city                        {"横浜市緑区"}
    address                     {"青山1-1-1"}
    building_name               {"柳ビル103"}
    phone_number                {"09012345678"}
    token                       {"tok_abcdefghijk00000000000000000"}
  end
end