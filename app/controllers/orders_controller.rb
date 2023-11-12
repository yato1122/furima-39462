class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
    if user_signed_in?
      # ログインしている場合の処理
      redirect_to root_path if current_user == @item.user || @item.order.present?
    else
      # ログインしていない場合の処理
      redirect_to new_user_session_path
    end
  end

  def new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :municipalities, :shipping_area_id, :street_address, :building_name, :tell).merge(
      item_id: @item.id, user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.item_price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
