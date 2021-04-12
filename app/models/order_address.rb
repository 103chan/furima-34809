class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :telephone, :order, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :telephone, format: {with: /\A[0-9]+\z/, message: "is invalid."}
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :telephone, length: { maximum: 11 }
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone, order_id: order.id)
  end
end