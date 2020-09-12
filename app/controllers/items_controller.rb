class ItemsController < ApplicationController
  before_action :login, except: [:index, :show, :search]
  before_action :item_show, only: [:show, :edit, :update, :destroy]
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
    if user_signed_in? && @item.user.id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  def show
    @comment = Comment.all
    @comments = @item.comments.includes(:user).order('created_at DESC')
  end

  def search
    @items = Item.search(search_params)
  end

  private

  def search_params
    params.require(:item).permit(:keyword)
  end

  def item_show
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:number, :name, :image, :instruction, :postage_id, :price, :category_id, :shipping_day_id, :item_status_id, :prefecture_id, :sold).merge(user_id: current_user.id)
  end

  def login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
