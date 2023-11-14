require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)  # Itemを作成する
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
      it 'tokenがあれば保存ができること' do
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        order_address = FactoryBot.build(:order_address, post_code: '1234567')
        order_address.valid?
        expect(order_address.errors[:post_code]).to include('is invalid. Include hyphen(-)')
      end

      it 'shipping_area_idを選択していないと保存できないこと' do
        order_address = FactoryBot.build(:order_address, shipping_area_id: nil)
        order_address.valid?
        expect(order_address.errors[:shipping_area_id]).to include("can't be blank")
      end

      it 'municipalitiesが空だと保存できないこと' do
        order_address = FactoryBot.build(:order_address, municipalities: nil)
        order_address.valid?
        expect(order_address.errors[:municipalities]).to include("can't be blank")
      end

      it 'street_addressが空だと保存できないこと' do
        order_address = FactoryBot.build(:order_address, street_address: nil)
        order_address.valid?
        expect(order_address.errors[:street_address]).to include("can't be blank")
      end

      it 'tellが空では保存できないこと' do
        order_address = FactoryBot.build(:order_address, tell: nil)
        order_address.valid?
        expect(order_address.errors[:tell]).to include("can't be blank")
      end

      it 'tellが9桁以下では購入できない' do
        @order_address.tell = '123456789' # 9桁
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell is too short (minimum is 10 characters)")
      end

      it 'tellに半角数字以外が含まれている場合は購入できない' do
        @order_address.tell = '123-4567-8901' # ハイフンを含む
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell is invalid")
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      
      it 'userが紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
