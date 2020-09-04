require 'rails_helper'

RSpec.describe UserItem, type: :model do
  describe '商品購入情報の保存' do
    before do
      @user_item = FactoryBot.build(:user_item)
    end
    describe '商品の購入ができるとき' do
      it 'カード情報があれば登録できる' do
        @user_item.number = '4242424242424242'
        expect(@item_user).to be_valid
  end
end