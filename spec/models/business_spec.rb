require 'rails_helper'
RSpec.describe Business, type: :model do
  it 'Valid if name is present' do
    @user = User.create!(name: 'okorojiebube', email: 'okorojiebube2@gmail.com', password: 1_234_567)
    @business = Business.create(name: 'goods', amount: 200.00, author_id: @user.id)
    expect(@business).to be_valid
  end

  it 'Invalid if name is absent' do
    @user = User.create!(name: 'okorojiebube', email: 'okorojiebube2@gmail.com', password: 1_234_567)
    @business = Business.create(amount: 200.00, author_id: @user.id)
    expect(@business).to be_valid
  end

  it 'Invalid if amount is absent' do
    @user = User.create!(name: 'okorojiebube', email: 'okorojiebube2@gmail.com', password: 1_234_567)
    @business = Business.create(name: 'goods', author_id: @user.id)
    expect(@business).to_not be_valid
  end

  it 'must be associated with a category' do
    @user = User.create!(name: 'okorojiebube', email: 'okorojiebube2@gmail.com', password: 1_234_567)
    @category = Category.create(name: 'Bitcoin', icon: 'www.pic.com', author_id: @user.id)
    @business = Business.create(name: 'goods', amount: 200.00, author_id: @user.id)
    @businesses_categories = @business.businesses_categories.create(business_id: @business.id,
                                                                    category_id: @category.id)
    expect(@businesses_categories).to be_valid
  end
end
