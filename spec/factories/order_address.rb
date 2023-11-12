FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    shipping_area_id { 1 }
    municipalities { '東京都' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    tell { 0o1234567 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
