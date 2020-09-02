class ItemsController < ApplicationController
  before_action :login, except: [:index, :show]
  before_action :item_show, only: [:show, :edit,:update,:destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
     end
  end

  def update
    if @item.valid?
       @item.update(item_params)
       redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  private

  def item_show
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :image, :instruction, :postage_id, :price, :category_id, :shipping_day_id, :item_status_id, :prefecture_id, :sold).merge(user_id: current_user.id)
  end

  def login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
