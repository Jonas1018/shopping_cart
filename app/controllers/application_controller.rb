class ApplicationController < ActionController::Base
  before_action :set_render_cart
  before_action :initialize_cart
  before_action :link_cart

  def set_render_cart
    @render_cart = true
  end

  def link_cart
    @link_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end