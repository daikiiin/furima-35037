class PurchaseOrder
   include ActiveModel::Model
   attr_accessor :user_id, :item_id, :post_code, :shipping_fee_destination_id, :city, :address, :building_name, :phone_number, :token
 
   with_options presence: true do
     validates :post_code
     validates :city
     validates :address
     validates :phone_number
   end
     validates :shipping_fee_destination_id, numericality: { other_than: 1 , message:'を選択して下さい'}
     validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "を正しく入力してください"}
     validates :phone_number, format: { with: /\A[0-9]+\z/, message: "に数字を使用してください"}
   def save
     purchase = Purchase.create(user_id: user_id, item_id: item_id)
     Order.create(post_code: post_code, shipping_fee_destination_id: shipping_fee_destination_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
   end
end