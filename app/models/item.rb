class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_fee
    belongs_to :days_to_ship
    belongs_to :prefecture

    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :days_to_ship_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
  end
