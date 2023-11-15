FactoryBot.define do
  factory :order do
    association :user
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
