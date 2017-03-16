class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  helper_method :index
end
