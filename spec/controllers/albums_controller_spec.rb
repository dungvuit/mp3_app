require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe "Count view in show album" do
    it "When album show then count view + 1" do
      @album = FactoryGirl.create(:album, count_view: 0)
      get :show, params: { id: @album.id }
      @album.reload
      expect(@album.count_view).to eq(1)
    end
  end
end
