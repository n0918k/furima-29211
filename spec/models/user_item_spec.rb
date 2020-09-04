require 'rails_helper'

RSpec.describe UserItem, type: :model do
  describe '商品購入できるとき' do
    before do
      @user_item = FactoryBot.build(:user_item)
    end
    describe '商品の購入ができるとき' do
      it '郵便番号が○○○-○○○○なら購入できる' do
        @user_item.house_number = '123-4567'
        expect(@user_item).to be_valid
      end
      it '都道府県の情報があれば購入できる' do
        @user_item.prefecture_id = '1'
        expect(@user_item).to be_valid
      end
      it '市区町村の情報があれば購入できる' do
        @user_item.city = 'あああ'
        expect(@user_item).to be_valid
      end
      it '番地の情報があれば購入できる' do
        @user_item.address = 'あああ'
        expect(@user_item).to be_valid
      end
      it '電話番号がハイフンなしで11桁なら登録できる' do
        @user_item.phone_number = '09012345678'
        expect(@user_item).to be_valid
      end

      describe '商品購入できないとき' do
        it '郵便番号が空だと購入できない' do
          @user_item.house_number = nil
          @user_item.valid?
          expect(@user_item.errors.full_messages).to include("House number can't be blank")
        end
        it '郵便番号にハイフンがないと購入できない' do
          @user_item.house_number = '1234567'
          @user_item.valid?
          expect(@user_item.errors.full_messages).to include('House number is invalid')
        end

        it '都道府県の情報がないと購入できない' do
          @user_item.prefecture_id = nil
          @user_item.valid?
          expect(@user_item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it '都道府県の情報がないと購入できない' do
          @user_item.prefecture_id = nil
          @user_item.valid?
          expect(@user_item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '市区町村の情報がないと購入できない' do
          @user_item.city = nil
          @user_item.valid?
          expect(@user_item.errors.full_messages).to include("City can't be blank")
        end

        it '番地の情報がないと購入できない' do
          @user_item.address = nil
          @user_item.valid?
          expect(@user_item.errors.full_messages).to include("Address can't be blank")
        end
        it '電話番号の情報がないと購入できない' do
          @user_item.phone_number = nil
          @user_item.valid?
          expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号にハイフンがあると購入できない' do
          @user_item.phone_number = '090-1234-5678'
          @user_item.valid?
          expect(@user_item.errors.full_messages).to include('Phone number is invalid')
        end
      end
    end
  end
end
