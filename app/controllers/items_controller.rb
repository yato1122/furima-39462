class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show]
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def delete
  # end

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
