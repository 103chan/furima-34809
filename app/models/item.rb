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

    with_options presence: true do
      validates :name
      validates :description
      validates :price
      validates :image
    end
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :days_to_ship_id
      validates :prefecture_id
    end
    validates :price, numericality: {with: /\A[\d]+\z/ }
    validates :price,  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
