class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :item_status
  has_one_attached :image
  belongs_to :user
  has_one :order
  has_many :comments

  with_options presence: true do
    validates :name
    validates :image
    validates :instruction
    validates :postage_id, numericality: { other_than: 0 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :category_id, numericality: { other_than: 0 }
    validates :shipping_day_id, numericality: { other_than: 0 }
    validates :item_status_id, numericality: { other_than: 0 }
    validates :prefecture_id, numericality: { other_than: 0 }
  end

  def self.search(search)
    if search != '' 
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
