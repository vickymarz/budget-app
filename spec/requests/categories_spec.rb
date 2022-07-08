require 'rails_helper'

describe 'Categories', type: :request do
  before(:each) { get categories_path }

  context 'index' do
    it 'GET /index returns okay status' do
      expect(response).to have_http_status(200)
    end

    it 'GET /index renders correct template(index)' do
      expect(response).to render_template(:index)
    end

    it 'GET /index include correct placeholder text' do
      expect(response.body).to include('Transactions')
    end
  end
end

describe 'Categories', type: :request do
  before(:each) { get category_path( id: 2 ) }

  context 'show' do
    it 'GET /show status' do
      expect(response).to have_http_status(200)
    end

    it 'GET /show render correct template(show)' do
      expect(response).to render_template(:show)
    end

    it 'GET /show include correct placeholder text' do
      expect(response.body).to include('Details')
    end
  end
end