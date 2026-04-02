class PagesController < ApplicationController
  def show
    @categories = Category.order(:name)
    @page = Page.find_by!(slug: params[:slug])
  end
end