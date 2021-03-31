class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchase = PurchaseOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = PurchaseOrder.new(purchase_params)
    if @purchase.valid?
       @purchase.save
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_order).permit(:post_code, :shipping_fee_destination_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index 
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
   end
  
end

