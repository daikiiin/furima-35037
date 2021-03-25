class ItemsController < ApplicationController
 def index
  @items = Item.all
 end

 def new
  @items = Item.new
 end

 def  item_params
  params.require(:item).permit(:image).merge(user_id: currrent_user.id)
 end
end
