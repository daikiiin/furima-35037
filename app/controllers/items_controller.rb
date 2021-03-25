class ItemsController < ApplicationController
 def index
 end

 def  item_params
  params.require(:item).permit(:image).merge(user_id: currrent_user.id)
 end
end
