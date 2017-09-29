require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'If user login as guest' do
    before do
      user = FactoryGirl.create(:user, email: Faker::Internet.email)
      sign_in user
    end

    it 'GET #index' do
      get :index
      expect(response).to be_success
    end
  end
end
