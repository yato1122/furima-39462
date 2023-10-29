require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品のバリデーション' do
    context '商品が出品できる場合' do
      it '全ての情報が正しく入力されている場合、商品を出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品に失敗する場合' do
      it '商品画像が空では出品できない' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors[:item_image]).to include("can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.item_title = nil
        @item.valid?
        expect(@item.errors[:item_title]).to include("can't be blank")
      end

      it '商品説明が空では出品できない' do
        @item.item_text = nil
        @item.valid?
        expect(@item.errors[:item_text]).to include("can't be blank")
      end

      it '価格が空では出品できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors[:item_price]).to include("can't be blank")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category = Category.find_by(name: '---')
        expect(@item).to_not be_valid
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition = Condition.find_by(name: '---')
        expect(@item).to_not be_valid
      end

      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_fee = ShippingFee.find_by(name: '---')
        expect(@item).to_not be_valid
      end

      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.shipping_area = ShippingArea.find_by(name: '---')
        expect(@item).to_not be_valid
      end

      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shipping_day = ShippingDay.find_by(name: '---')
        expect(@item).to_not be_valid
      end

      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.item_price = '123abc'
        expect(@item).to_not be_valid
      end

      it '価格が300円未満では出品できない' do
        @item.item_price = 299
        expect(@item).to_not be_valid
      end

      it '価格が9,999,999円を超えると出品できない' do
        @item.item_price = 10_000_000
        expect(@item).to_not be_valid
      end

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        expect(@item).to_not be_valid
      end
    end
  end
end
