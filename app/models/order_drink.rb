class OrderDrink < ApplicationRecord
  belongs_to :order, inverse_of: :order_drinks
  belongs_to :drink, inverse_of: :order_drinks
end
