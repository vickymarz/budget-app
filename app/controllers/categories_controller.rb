class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.all
  end
  
  def new
    @category = Category.new
  end
  
end
