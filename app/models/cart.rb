class Cart < ApplicationRecord
  has_many :orders, :dependent => :destroy  
  has_many :products, through: :orders

  def total
    orders.to_a.sum { |order| order.total }
  end

  # def cart_increase
  #   order.total + 1
  # end

  # def cart_decrease
  #   order.total + 1
  # end
end
