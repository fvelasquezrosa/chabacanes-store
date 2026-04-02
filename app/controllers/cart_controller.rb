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
end