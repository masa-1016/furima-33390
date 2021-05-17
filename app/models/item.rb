class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery

  validates :name, :explanation, :price, presence: true
  validates :category_id, :condition_id, :postage_id, :area_id, :delivery_id, numericality: { other_than: 1 }
end
