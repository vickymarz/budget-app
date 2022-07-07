class BusinessesController < ApplicationController
  def new
    @category = Category.includes(:businesses_categories).find(params[:category_id])
    @business = @category.businesses.new
  end

  def create
    @category = Category.includes(:businesses_categories).find(params[:category_id])
    @business = @category.businesses.new(business_params)
    if  @business.save
      flash[:success] = 'Ingredient added successfully'
      redirect_to category_path(@category.id)
    else
      flash.now[:error] = 'Error: Ingredient could not be added'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe_food = RecipeFood.includes(:food, :recipe).find(params[:id])
    if @recipe_food.destroy
      flash[:success] = 'Ingredient was successfully deleted.'
      redirect_to recipes_path
    else
      flash[:error] = 'Something went wrong'
      render :show
    end
  end

  def business_params
   params.require(:recipe_food).permit(:name, :amount, :author_id)
  end
end
