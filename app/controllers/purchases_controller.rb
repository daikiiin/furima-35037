class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index
  def index
    @purchase = PurchaseOrder.new
  end

  def create
    @purchase = PurchaseOrder.new(purchase_params)
    if @purchase.valid?
       pay_item
       @purchase.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_order).permit(:post_code, :shipping_fee_destination_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index 
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase.present?
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.cost ,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  def set_item
    @item = Item.find(params[:item_id])
  end 
end

