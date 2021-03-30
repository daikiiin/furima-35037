class PurchaseOrder
   include ActiveModel::Model
   attr_accessor :user_id, :item_id, :post_code, :shipping_fee_destination_id, :city, :address, :building_name, :phone_number
 
   with_options presence: true do
     validates :post_code
     validates :city
     validates :address
     validates :phone_number
   end
    validates :shipping_fee_destination_id, numericality: { other_than: 1 , message:'を選択して下さい'}

   def save
    Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(post_code: post_code, shipping_fee_destination_id: shipping_fee_destination_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
   end
end