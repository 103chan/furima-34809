require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入がうまくいくとき' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      sleep (0.1)
      @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
    end

    context '購入がうまくいくとき' do
      it 'post_codeとprefecture_id、cityとaddress、telephoneが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank", "Post code is invalid. Include hyphen(-)"
      end
      it 'post_codeにhyphen(-)が無ければ登録できない' do
        @order_address.post_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end
      it 'prefecture_idが1では登録できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'cityが空では登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'telephoneが空では登録できない' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone can't be blank"
      end
      it 'telephoneが12ケタ以上では登録できない' do
        @order_address.telephone = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone is too long (maximum is 11 characters)"
      end
    end
  end
end
