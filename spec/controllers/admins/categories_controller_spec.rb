require 'rails_helper'

RSpec.describe Admins::CategoriesController, type: :controller do
  context 'Manager category if user is admin' do
    before do
      user = FactoryGirl.create(:user, is_admin: true,
                                       email: Faker::Internet.email)
      sign_in user
    end

    it '#GET Category' do
      get :index
      expect(response).to be_success
    end

    it '#Create category' do
      expect do
        post :create, params: { category: { name: Faker::Name.name } }
      end.to change(Category, :count).by(1)
    end

    it '#Edit category' do
      @category = FactoryGirl.create(:category)
      patch :update, params: { id: @category.id, category: { name: Faker::Name.name } }
      expect(response).to redirect_to(admins_categories_path)
    end

    it 'Delete category' do
      @category = FactoryGirl.create(:category)
      expect do
        delete :destroy, params: { id: @category.id }
      end.to change(Category, :count).by(-1)
    end
  end
end
