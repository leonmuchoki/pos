class Menu < ApplicationRecord
  validates :name, presence: true
  has_many :foods
  has_many :drinks
end
