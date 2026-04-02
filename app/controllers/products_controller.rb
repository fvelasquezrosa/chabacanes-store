class ProductsController < ApplicationController
  def index
    @categories = Category.order(:name)
    @products = Product.includes(:category).order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.order(:name)
  end
end