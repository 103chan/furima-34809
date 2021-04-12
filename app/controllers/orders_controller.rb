class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :order_login
  before_action :purchased_item
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    #binding.pry
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
    )
  end

  def order_login
    @order_address = OrderAddress.new(params[:id])
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def purchased_item
    @order_address = OrderAddress.new(params[:id])
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end
end
