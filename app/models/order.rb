class Order < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_fee_destination_id

  with_options presence: true do
    validates :post_code
    validates :city
    validates :address
    validates :phone_number
 end
   validates :shipping_fee_destination_id, numericality: { other_than: 1 , message:'を選択して下さい'}
end
