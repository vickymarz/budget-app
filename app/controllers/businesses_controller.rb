class BusinessesController < ApplicationController
  def new
    @category = Category.includes(:businesses_categories).find(params[:category_id])
    @business = @category.businesses.new
    @categories = Category.where(author_id: current_user.id)
  end

  def create
    @category = Category.includes(:businesses_categories).find(params[:category_id])
    @business = @category.businesses.new(business_params)
    if  @business.save
      BusinessesCategory.create(category_id: @category.id, business_id: @business.id )
      flash[:success] = 'Transaction added successfully'
      redirect_to category_path(@category.id)
    else
      flash.now[:error] = 'Error: Transaction could not be added'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.includes(:businesses_categories).find(params[:category_id])
    @business = @category.businesses.includes(:businesses_categories).find(params[:id])
     @business_category = BusinessesCategory.where(category_id: @category.id, business_id: @business.id )
    if  @business.destroy
      flash[:success] = 'Transaction was successfully deleted.'
      redirect_to category_path(@category.id)
    else
      flash[:error] = 'Something went wrong'
      render :show
    end
  end

  def business_params
    my_business = params.require(:business).permit(:name, :amount)
    my_business[:author] = current_user
    my_business
  end
end
