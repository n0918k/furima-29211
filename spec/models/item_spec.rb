require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/files/test_image.png')
  end

  describe '出品できるとき' do
    it '商品名があれば出品できる' do
      @item.name = 'aaa'
      expect(@item).to be_valid
    end

    it '画像があれば出品できる'do
      @item = @item.image
      expect(@item).to be_valid
    end

    it '商品説明があれば出品できる' do
      @item.instruction = "aaa"
      expect(@item).to be_valid
    end

    it 'カテゴリーの情報があれば出品できる' do
      @item.category_id = "1"
      expect(@item).to be_valid
    end

    it '商品の状態についての情報があれば出品できる' do
      @item.item_status_id = "2"
      expect(@item).to be_valid
    end

    it '配送の負担についてのの情報があれば出品できる' do
      @item.postage_id = "1"
      expect(@item).to be_valid
    end

    it '発送元の地域についての情報があれば出品できる' do
      @item.prefecture_id = "1"
      expect(@item).to be_valid
    end

    it '発送までの日数についての情報があれば出品できる' do
      @item.shipping_day_id = "1"
      expect(@item).to be_valid
    end

    it '価格が300円以上であれば出品できる' do
      @item.price = "300"
      expect(@item).to be_valid
    end

    it '価格が9,999,999円以下であれば出品できる' do
      @item.price = "9999999"
      expect(@item).to be_valid
    end


  end

  describe '出品できないとき' do
    it '商品名がないと出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '画像がないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品説明がないと出品できない' do
      @item.instruction = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Instruction can't be blank")
    end

    it 'カテゴリーの情報がないと出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態についての情報がないと出品できない' do
      @item.item_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status can't be blank")
    end

    it '配送料についての情報がないと出品できないこと' do
      @item.postage_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end

    it '発送元の地域の情報がないと出品できないこと' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数についての情報がないと出品できないこと' do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end

    it '価格の情報がないと出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が299円以下だと出品できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格が9,999,999円以上だと出品できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it '価格が全角数字だと出品できないこと' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
