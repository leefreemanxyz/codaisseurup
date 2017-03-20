class Api::CategoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    categories = Category.all
    render status:200, json:categories
  end
  def show
    category = Category.find(params[:id])
    render status:200, json:category
  end
  def create

    category = Category.new(category_params)

    if category.save
      render status: 201, json:category
    else
      render status:422, json:category
    end
  end
  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      render status: 201, json:category
    else
      render status:422, json:category
    end
  end
  def destroy
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
