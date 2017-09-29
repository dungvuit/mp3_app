require 'rails_helper'

RSpec.describe Admins::UsersController, type: :controller do
  context 'Manager user if user is admin' do
    before do
      user = FactoryGirl.create(:user, is_admin: true,
                                       email: Faker::Internet.email)
      sign_in user
    end

    it 'GET #index' do
      get :index
      expect(response).to be_success
    end

    it 'Delete User' do
      @user = FactoryGirl.create(:user)
      expect do
        delete :destroy, params: { id: @user.id }
      end.to change(User, :count).by(-1)
    end
  end
end
