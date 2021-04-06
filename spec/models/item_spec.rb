require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録がうまくいくとき' do
    context '新規登録がうまくいくとき' do
      it "nameとdescription、category_idとcondition_id、delivery_fee_idとprefecture_id、days_to_ship_idとpriceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品登録がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 1"
      end
      it 'delivery_fee_idが1では登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 1"
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'days_to_ship_idが1では登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship must be other than 1"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが半角英数混合では登録できない' do
        @item.price = '3aa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが半角英語では登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが299円以下では登録できない' do
        @item.price = 299
        @item.valid?
        #binding.pry
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが10,000,000円以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
    end
  end
end