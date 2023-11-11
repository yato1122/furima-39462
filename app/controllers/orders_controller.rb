class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @order_address = OrderAddress.new

  end

  def new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  private
  
  def order_params
    params.require(:order_address).permit(:post_code,:municipalities, :shipping_area_id, :street_address, :building_name, :tell ).merge(item_id: @item.id, user_id: current_user.id )
  end
end

