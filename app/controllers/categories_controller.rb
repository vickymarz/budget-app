class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.all
  end
  
  def new
    @category = current_user.categories.new
  end
  
  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      flash[:success] = "Category successfully created"
      redirect_to categories_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def category_params
    my_category = params.require(:category).permit(:name, :icon)
    my_category[:user] = current_user
    my_category
  end
  
end
