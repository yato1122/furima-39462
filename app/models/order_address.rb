class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :shipping_area_id, :municipalities, :street_address, :building_name, :tell, :order,:user_id, :item_id
  
  with_options presence: true do
    validates :shipping_area_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :street_address
    validates :tell
    validates :token, presence: true

end
def save
  order = Order.create(item_id: @item_id, user_id: user_id)
  Address.create(post_code: post_code,
    municipalities: municipalities,
    shipping_area_id: shipping_area_id,
    street_address: street_address,
    building_name: building_name,
    tell: tell,
    order_id: order.id)
end
end