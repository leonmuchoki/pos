class OrderFood < ApplicationRecord
  belongs_to :order, inverse_of: :order_foods
  belongs_to :food, inverse_of: :order_foods
end
