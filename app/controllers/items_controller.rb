class ItemsController < ApplicationController
  before_action :login,except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:image,:instruction,:postage_id,:price,:category_id,:shipping_day_id,:item_status_id,:prefecture_id).merge(user_id: current_user.id)
  end
  
  def login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
