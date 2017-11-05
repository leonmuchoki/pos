FactoryBot.define do
  factory :order_detail do
    amount "9.99"
    quantity 1
    drink nil
    food nil
    order nil
  end
end
