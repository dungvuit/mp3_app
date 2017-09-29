require 'rails_helper'

RSpec.describe Admins::AuthorsController, type: :controller do
  context 'Manager author if user is admin' do
    before do
      user = FactoryGirl.create(:user, is_admin: true,
                                       email: Faker::Internet.email)
      sign_in user
    end

    it '#GET authors' do
      get :index
      expect(response).to be_success
    end

    it '#Create author' do
      expect do
        post :create, params: { author: { name: Faker::Name.name } }
      end.to change(Author, :count).by(1)
    end

    it '#Edit author' do
      @author = FactoryGirl.create(:author)
      patch :update, params: { id: @author.id, author: { name: Faker::Name.name } }
      expect(response).to redirect_to(admins_authors_path)
    end

    it 'Delete author' do
      @author = FactoryGirl.create(:author)
      expect do
        delete :destroy, params: { id: @author.id }
      end.to change(Author, :count).by(-1)
    end
  end
end
