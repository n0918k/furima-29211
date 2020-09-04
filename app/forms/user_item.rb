class UserItem
  include ActiveModel::Model
  attr_accessor :house_number, :prefecture_id, :city, :address, :phone_number, :building_name, :item_id, :token, :user_id, :price, :number, :exp_month, :exp_year, :cvc
  with_options presence: true do
    
    validates :token
    validates :house_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  end

  def save
    Order.create( house_number: house_number, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, item_id: item_id, user_id: user_id, price: price)
    item = Item.find(item_id)
    item.update(sold: 1)
  end
end
