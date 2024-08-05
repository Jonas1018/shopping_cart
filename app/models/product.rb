class Product < ApplicationRecord
  has_many :orders, :dependent => :destroy 
  has_many :carts, through: :orders
end

