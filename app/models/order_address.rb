class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :shipping_area_id, :municipalities, :street_address, :building_name, :tell, :order, :user_id,
                :item_id

  with_options presence: true do
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :street_address
    validates :tell, length: { minimum: 10 }, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :token
  end
  def save
    order = Order.create(item_id: @item_id, user_id: user_id)
    Address.create(
      post_code: post_code,
      municipalities: municipalities,
      shipping_area_id: shipping_area_id,
      street_address: street_address,
      building_name: building_name,
      tell: tell,
      order_id: order.id
    )
end
end