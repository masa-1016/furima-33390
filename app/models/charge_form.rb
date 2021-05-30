class ChargeForm

  include ActiveModel::Model
  attr_accessor :postal, :area_id, :city, :address, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :telephone, format: { with: /\A\d{10,11}\z/ }
    validates :city, :address, :telephone, :token, :user_id, :item_id
  end
  
  validates :area_id, numericality: { other_than: 1 }

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, area_id: area_id, city: city, address: address, building: building, telephone: telephone, history_id: history.id)
  end
end