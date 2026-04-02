class ProductsController < ApplicationController
  def index
    @products = Product.includes(:category).order(created_at: :desc)
    @categories = Category.order(:name)
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.order(:name)
  end
end