class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipalities, :street_address, :building_name, :tell, :order,:user_id, :item
  
  with_options presence: true do
    validates :shipping_area_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :street_address
    validates :tell
end