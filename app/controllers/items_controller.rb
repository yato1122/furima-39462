class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
    @categories = Category.all
    @conditions = Condition.all
    @shipping_areas = ShippingArea.all
    @shipping_days = ShippingDay.all
    @shipping_fee = ShippingFee.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

 

  def edit
  end

  def delete
  end
end

private
def item_params
  params.require(:item).permit(
    :item_title,
    :item_text,
    :item_price,
    :category_id,
    :condition_id,
    :shipping_fee_id,
    :shipping_area_id,
    :shipping_days_id
  )
end