class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @categories = Category.order(:name)
    @products = @category.products.order(created_at: :desc).page(params[:page]).per(6)

    render "products/index"
  end
end