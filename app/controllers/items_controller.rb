class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new ,:create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
 def index
  @items = Item.all.order(id: "DESC")
 end

 def new
  @item = Item.new
 end

 def create
   @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
 end

 def show
 end

 def edit
 end

 def update
   if @item.update(item_params)
     redirect_to item_path
   else
     render :edit
   end
 end

 def destroy
  redirect_to root_path if @item.destroy
 end

 private 

 def item_params
  params.require(:item).permit(:name, :explain, :category_id, :item_status_id, :shipping_fee_status_id, :shipping_fee_destination_id, :shipping_fee_day_id, :cost, :image).merge(user_id: current_user.id)
 end

 def move_to_index 
  redirect_to root_path if current_user.id != @item.user_id || @item.purchase.present?
 end

 def set_item
   @item = Item.find(params[:id])
 end
end
