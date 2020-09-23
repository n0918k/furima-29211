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
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :image
    validates :instruction
    validates :postage_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :category_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :shipping_day_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :item_status_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
  end

  def self.search(search)
    if search != ''
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  def self.category(category)
    if 0 < category.to_i && category.to_i < 11
      Item.where('category_id LIKE(?)', "%#{category}%")
    else
      Item.all
    end
  end
end
