class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
 belongs_to :user
 has_one_attached :item_image
 validates :item_image, presence: true
 #has_one  :order
 validates :item_title, presence: true
 validates :item_text, presence: true
 validates :category_id, numericality: { other_than: 1 } 
 validates :condition_id, numericality: { other_than: 1 } 
 validates :shipping_area_id, numericality: { other_than: 1 } 
 validates :shipping_days_id, numericality: { other_than: 1 } 
 validates :shipping_fee_id, numericality: { other_than: 1 } 
 validates :item_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
end