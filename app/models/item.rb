class Item < ApplicationRecord
  belongs_to :merchant
  has_many :reviews, dependent: :destroy
  has_many :item_orders
  has_many :orders, through: :item_orders

  validates_presence_of :name,
                        :description,
                        :price,
                        :inventory
  validates_inclusion_of :active?, :in => [true, false]
  validates_numericality_of :price, greater_than: 0

  after_initialize :set_defaults

  def set_defaults
    self.image = "https://semantic-ui.com/images/wireframe/image.png" if self.image == ""
  end

  def self.active_items
    Item.where(active?:true)
  end

  def self.top_five_items
    Item.select("items.*, SUM(quantity) AS qty")
    .joins(:item_orders)
    .group(:id)
    .order("qty DESC")
    .limit(5)
  end

  def self.bottom_five_items
    Item.select("items.*, SUM(quantity) AS qty")
    .joins(:item_orders)
    .group(:id)
    .order("qty ASC")
    .limit(5)
  end

  def order_count
    item_orders.sum(:quantity)
  end

  def average_review
    reviews.average(:rating)
  end

  def sorted_reviews(limit, order)
    reviews.order(rating: order).limit(limit)
  end

  def no_orders?
    item_orders.empty?
  end

  def fulfillable?(num)
    num <= inventory
  end

  def item_order(order_id)
    Order.find(order_id).item_orders.where(:item_id => id).first
  end

  def fulfilled_inventory(order_id)
    self.inventory -= item_order(order_id).quantity
  end
end
