class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category_id
    belongs_to :condition_id
    belongs_to :delivery_fee_id
    belongs_to :day_to_ship_id
    belongs_to :prefecture_id

    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :day_to_ship_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
  end
