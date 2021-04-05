class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
    #biding.pry
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
