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
end
