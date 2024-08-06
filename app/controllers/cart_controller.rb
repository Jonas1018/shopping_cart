class CartController < ApplicationController
  def show
    @render_cart = false
    @link_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_order = @cart.orders.find_by(product_id: @product.id)
    if current_order && quantity > 0
      current_order.update(quantity: current_order.quantity + quantity)
    elsif quantity <= 0
      current_order.destroy
    else
      @cart.orders.create(product: @product, quantity: quantity)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                    partial: 'cart/cart',
                                                    locals: { cart: @cart}),
                              turbo_stream.replace(@product)]
      end
    end
  end

  def plusOne
    @link_cart = false
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_order = @cart.orders.find_by(product_id: @product.id)
    if current_order && quantity > 0
      current_order.update(quantity: current_order.quantity + 1)
    elsif quantity <= 0
      current_order.destroy
    else
      @cart.orders.create(product: @product, quantity: quantity)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                    partial: 'cart/cart',
                                                    locals: { cart: @cart}),
                              turbo_stream.replace(@product)]
      end
    end
  end

  def minusOne
    @link_cart = false
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_order = @cart.orders.find_by(product_id: @product.id)
    if current_order && quantity > 0
      current_order.update(quantity: current_order.quantity - 1)
    elsif quantity <= 0
      current_order.destroy
    else
      @cart.orders.create(product: @product, quantity: quantity)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                    partial: 'cart/cart',
                                                    locals: { cart: @cart}),
                              turbo_stream.replace(@product)]
      end
    end
  end

  def remove
    Order.find_by(id: params[:id]).destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                    partial: 'cart/cart',
                                                    locals: { cart: @cart })]
      end
    end
  end 
end