class OrderSerializer < ActiveModel::Serializer
  attributes :id, :amount, :processed, :created_at, :user_id, :restaurant_table_id
end
