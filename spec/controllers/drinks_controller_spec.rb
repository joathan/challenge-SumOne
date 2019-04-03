require 'rails_helper'

RSpec.describe DrinksController, type: :controller do
  describe 'access' do
    context '#index' do
      it 'responds successfully' do
        get :index
        expect(response).to be_success
      end

      it 'responds a 200 response' do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end
end
