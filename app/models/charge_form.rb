class ChargeForm

  include ActiveModel::Model
  attr_accessor :postal, :area_id, :city, :address, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal, :city, :address, :telephone
    validates :token
  end
  
  validates :area_id, numericality: { other_than: 1 }

  def save
    Address.create(postal: postal, area: area, city: city, address: address, building: building, telephone: telephone, history_id: history.id)
  end
end