require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  describe "GET #index" do
    it "assigns all photos as @photos" do
      photo = create(:photo)
      get :index, {}
      expect(assigns(:photos)).to eq([photo])
    end
  end
end
