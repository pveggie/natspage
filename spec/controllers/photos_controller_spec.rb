require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  after { Photo.destroy_all }

  describe "GET #index" do
    it "assigns all photos as @photos" do
      photo = create(:local_photo)
      get :index, {}
      expect(assigns(:photos)).to eq([photo])
    end
  end

  describe "GET #new" do
    it "assigns a new photo as @photo" do
      get :new, {}
        expect(assigns(:photo)).to be_a_new(Photo)
    end
  end
end
