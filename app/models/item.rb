class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_fee_status
  belongs_to :shipping_fee_destination
  belongs_to :shipping_fee_day

  validates :image,                       presence: true
  validates :name,                        presence: true
  validates :explain,                     presence: true
  validates :category_id,                 numericality: { other_than: 1 }
  validates :item_status_id,              numericality: { other_than: 1 }
  validates :shipping_fee_status_id,      numericality: { other_than: 1 }
  validates :shipping_fee_destination_id, numericality: { other_than: 1 }
  validates :shipping_fee_day_id,         numericality: { other_than: 1 }
  validates :cost,                        presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/, message: 'に半角数字を使用してください' }
end
