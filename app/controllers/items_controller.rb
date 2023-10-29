class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def delete
  # end

  private

  def item_params
    params.require(:item).permit(
      :item_image,
      :item_title,
      :item_text,
      :item_price,
      :category_id,
      :condition_id,
      :shipping_fee_id,
      :shipping_area_id,
      :shipping_days_id
    ).merge(user_id: current_user.id)
  end
end
