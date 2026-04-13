class CartController < ApplicationController
  def show
    session[:cart] ||= {}

    @cart_items = Product.find(session[:cart].keys).map do |product|
      {
        product: product,
        quantity: session[:cart][product.id.to_s]
      }
    end
  end

  def add
    session[:cart] ||= {}
    product_id = params[:id].to_s

    session[:cart][product_id] ||= 0
    session[:cart][product_id] += 1

    redirect_to cart_path, notice: "Product added to cart."
  end

  def update
    session[:cart] ||= {}
    product_id = params[:id].to_s
    quantity = params[:quantity].to_i

    if quantity > 0
      session[:cart][product_id] = quantity
      redirect_to cart_path, notice: "Cart quantity updated."
    else
      session[:cart].delete(product_id)
      redirect_to cart_path, notice: "Item removed from cart."
    end
  end

  def remove
    session[:cart] ||= {}
    product_id = params[:id].to_s

    session[:cart].delete(product_id)
    redirect_to cart_path, notice: "Item removed from cart."
  end
end