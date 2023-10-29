FactoryBot.define do
  factory :item do
    item_title { 'Test Item' }
    item_text { 'This is a test item' }
    item_price { 1000 }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }
    item_image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_image.png'), 'image/png') }
    association :user
  end
end
