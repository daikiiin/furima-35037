class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_fee_status
  belongs_to :shipping_fee_destination
  belongs_to :shipping_fee_day


  with_options presence: true do
    validates :image                       
    validates :name                 
    validates :explain           
  end
  with_options numericality: { other_than: 1 , message:'を選択して下さい'} do
    validates :category_id         
    validates :item_status_id      
    validates :shipping_fee_status_id   
    validates :shipping_fee_destination_id
    validates :shipping_fee_day_id   
  end   
  validates :cost,                        presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/}
end
