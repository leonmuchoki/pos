class User < ApplicationRecord
  has_many :orders
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def generate_api_key
    self.update_column(:api_key, SecureRandom.hex(16))
  end
end
