class Order
  include ActiveModel::Model
  attr_accessor :token
  validates :token, presence: true
end
