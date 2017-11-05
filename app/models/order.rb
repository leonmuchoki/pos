class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant_table

  has_many :order_drinks, inverse_of: :order
  has_many :drinks, through: :order_drinks

  has_many :order_foods, inverse_of: :order
  has_many :foods, through: :order_foods

  accepts_nested_attributes_for :order_drinks
  accepts_nested_attributes_for :order_foods
end
