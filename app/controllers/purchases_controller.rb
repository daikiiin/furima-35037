class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.find(params[:id])
  end

  def create
    @purchase = Purchase.find(params[:id])
    @purchase.create(purchase_params)
  end

#  private
#   def purchase_params
#     params.require(:purchase).permit(:)
#   end
# end
