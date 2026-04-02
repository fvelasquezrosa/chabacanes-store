class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
    @categories = Category.order(:name)

    render "products/index"
  end
end