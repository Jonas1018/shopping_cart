class Orderableable < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total
    product.prize * quantity
  end
end
