class PurchasesController < ApplicationController
  def index
    @purchase = PurchaseOrder.new
  end

  def create
    @purchase = PurchaseOrder.new(purchase_params)
    @purchase.save
  end

  private

  def purchase_params
    params.require(:purchases_order).permit(:user_id, :item_id, :post_code, :shipping_fee_destination_id, :city, :address, :building_name, :phone_number)
  end
end

