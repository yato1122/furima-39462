class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

   def destroy
    @item.destroy
    redirect_to root_path
   end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    return unless @item.user_id != current_user.id

    redirect_to root_path
  end

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
      :shipping_day_id
    ).merge(user_id: current_user.id)
  end
end
