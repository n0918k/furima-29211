class OrdersController < ApplicationController
  before_action :login
  before_action :sold
  def index
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new
  end

  def create

      @user_item = UserItem.new(order_params)

      if @user_item.valid?
        pay_item
        @user_item.save
        redirect_to root_path
       else
        @item = Item.find(params[:item_id])
        render :index
      end
  end

  private

  def order_params
    item = Item.find(params[:item_id])
    params.permit(:number, :token, :house_number, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :exp_month, :exp_year, :cvc).merge(user_id: current_user.id, price: item.price)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
  private

  def login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def sold
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id or item.sold == "1"
      redirect_to root_path 
    end
  end
end
