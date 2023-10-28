# spec/models/item_spec.rb

require 'rails_helper'

RSpec.describe Item, type: :model do
  # テストデータをセットアップ
  let(:item) { build(:item) }

  it '正常にバリデーションを通過すること' do
    expect(item).to be_valid
  end

  it 'item_titleが必須であること' do
    item.item_title = nil
    expect(item).to_not be_valid
  end

  it 'item_textが必須であること' do
    item.item_text = nil
    expect(item).to_not be_valid
  end

  it 'item_priceが必須であること' do
    item.item_price = nil
    expect(item).to_not be_valid
  end

  it 'category_idが必須であること' do
    item.category_id = nil
    expect(item).to_not be_valid
  end

  it 'condition_idが必須であること' do
    item.condition_id = nil
    expect(item).to_not be_valid
  end

  it 'shipping_fee_idが必須であること' do
    item.shipping_fee_id = nil
    expect(item).to_not be_valid
  end

  it 'shipping_area_idが必須であること' do
    item.shipping_area_id = nil
    expect(item).to_not be_valid
  end

  it 'shipping_days_idが必須であること' do
    item.shipping_days_id = nil
    expect(item).to_not be_valid
  end
    it '画像が空では出品できない' do
      item = build(:item, item_image: nil, user: user)
      expect(item).not_to be_valid
    end
  
    it 'カテゴリーに「---」が選択されている場合は出品できない' do
      category = create(:category_id, name: '---')
      item = build(:item, category: category, user: user)
      expect(item).not_to be_valid
    end
  
    it '商品の状態に「---」が選択されている場合は出品できない' do
      condition = create(:condition, name: '---')
      item = build(:item, condition: condition, user: user)
      expect(item).not_to be_valid
    end
    it '配送料の負担に「---」が選択されている場合は出品できない' do
      condition = create(shipping_fee:, name: '---')
      item = build(:item, shipping_fee: shipping_fee, user: user)
      expect(item).not_to be_valid
    end
    it '発送元の地域に「---」が選択されている場合は出品できない' do
      condition = create(shipping_area:, name: '---')
      item = build(:item, shipping_area: shipping_area, user: user)
      expect(item).not_to be_valid
    end
    it '発送までの日数に「---」が選択されている場合は出品できない' do
      condition = create(shipping_days:, name: '---')
      item = build(:item, shipping_days: shipping_days, user: user)
      expect(item).not_to be_valid
      it '価格に半角数字以外が含まれている場合は出品できない' do
        item.item_price = 'abc'
        expect(item).not_to be_valid
      end
    
      it '価格が300円未満では出品できない' do
        item.item_price = 299
        expect(item).not_to be_valid
      end
    
      it '価格が9_999_999円を超えると出品できない' do
        item.item_price = 10_000_000
        expect(item).not_to be_valid
      end
    
      it 'userが紐付いていなければ出品できない' do
        item.user = nil
        expect(item).not_to be_valid
  end
end
