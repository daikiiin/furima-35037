class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

 def index
  @items = Item.all
 end

 def new
  @items = Item.new
 end

 private 
 def  item_params
  params.require(:item).permit(:name, :explain, :category_id, :item_status_id, :shipping_fee_status_id, :shipping_fee_destination_id, :shipping_fee_day_id, :cost, :image).merge(user_id: currrent_user.id)
 end
end
