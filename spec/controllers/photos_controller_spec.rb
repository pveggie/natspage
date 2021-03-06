require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  after { Photo.destroy_all }
  # This should return the minimal set of attributes required to create a valid
  # Photo. As you add validations to Photo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for(:remote_photo) }

  let(:invalid_attributes) do
    string = "123456789A"
    30.times { string += "123456789A" }
    attributes_for(:photo, caption_title: string)
  end

  let(:new_attributes) { attributes_for(:remote_photo, caption_title: "changed title") }

  let(:admin) { create(:admin) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PhotosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all photos as @photos" do
      photo = Photo.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:photos)).to eq([photo])
    end

    it "assigns all categories as @categories" do
      category = create(:category)
      get :index, {}, valid_session
      expect(assigns(:categories)).to eq([category])
    end
  end

  # describe "GET #show" do
  #   it "assigns the requested photo as @photo" do
  #     photo = Photo.create! valid_attributes
  #     get :show, {:id => photo.to_param}, valid_session
  #     expect(assigns(:photo)).to eq(photo)
  #   end
  # end

  describe "GET #new" do
    context "when user is not a logged in admin", focus: true do
      it "redirects to the index" do
        get :new, {}, valid_session
        expect(response).to redirect_to(photos_path)
      end
    end

    context "when user is admin" do
      it "assigns a new photo as @photo" do
        sign_in(admin)
        get :new, {}, valid_session
        expect(assigns(:photo)).to be_a_new(Photo)
      end
    end
  end

  describe "POST #create" do
    context "when user is not a logged in admin", focus: true do
      it "does not create a new photos_path" do
        expect {
            post :create, {:photo => valid_attributes}, valid_session
          }.to change(Photo, :count).by(0)
      end
    end

    context "when user is admin" do
      before { sign_in(admin) }

      context "with valid params" do
        it "creates a new Photo" do
          expect {
            post :create, {:photo => valid_attributes}, valid_session
          }.to change(Photo, :count).by(1)
        end

        it "assigns a newly created photo as @photo" do
          post :create, {:photo => valid_attributes}, valid_session
          expect(assigns(:photo)).to be_a(Photo)
          expect(assigns(:photo)).to be_persisted
        end

        it "redirects to the index page" do
          post :create, {:photo => valid_attributes}, valid_session
          expect(response).to redirect_to(photos_path)
        end
      end

      context "with invalid params" do
        it "assigns a newly created but unsaved photo as @photo" do
          post :create, {:photo => invalid_attributes}, valid_session
          expect(assigns(:photo)).to be_a_new(Photo)
        end

        it "re-renders the 'new' template" do
          post :create, {:photo => invalid_attributes}, valid_session
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe "GET #edit" do
    context "when user is not logged in and admin", focus: true do
      it "redirects to the index" do
        photo = Photo.create! valid_attributes
        get :edit, {:id => photo.to_param}, valid_session
        expect(response).to redirect_to(photos_path)
      end
    end

    context "with admin user" do
      it "assigns the requested photo as @photo" do
        sign_in(admin)
        photo = Photo.create! valid_attributes
        get :edit, {:id => photo.to_param}, valid_session
        expect(assigns(:photo)).to eq(photo)
      end
    end
  end

  describe "PUT #update" do
    context "when user is not logged in and admin", focus: true do
      it "does not update the photo" do
        photo = Photo.create! valid_attributes
        title = Photo.first.caption_title
        put :update, {:id => photo.to_param, :photo => new_attributes}, valid_session
        expect(photo.caption_title).to eql(title)
      end
    end

    context "with admin user" do
      before { sign_in(admin) }

      context "with valid params" do
        it "updates the requested photo" do
          photo = Photo.create! valid_attributes
          put :update, {:id => photo.to_param, :photo => new_attributes}, valid_session
          photo.reload
          expect(photo.caption_title).to eql("changed title")
        end

        it "assigns the requested photo as @photo" do
          photo = Photo.create! valid_attributes
          put :update, {:id => photo.to_param, :photo => valid_attributes}, valid_session
          expect(assigns(:photo)).to eq(photo)
        end

        it "redirects to the index" do
          photo = Photo.create! valid_attributes
          put :update, {:id => photo.to_param, :photo => valid_attributes}, valid_session
          expect(response).to redirect_to(photos_path)
        end
      end

      context "with invalid params" do
        it "assigns the photo as @photo" do
          photo = Photo.create! valid_attributes
          put :update, {:id => photo.to_param, :photo => invalid_attributes}, valid_session
          expect(assigns(:photo)).to eq(photo)
        end

        it "re-renders the 'edit' template" do
          photo = Photo.create! valid_attributes
          put :update, {:id => photo.to_param, :photo => invalid_attributes}, valid_session
          expect(response).to render_template(:edit)
        end
      end
    end
  end

  describe "DELETE #destroy" do
    context "when user is not logged in and admin", focus: true do
      it "does not delete the photo" do
        photo = Photo.create! valid_attributes
        expect {
        delete :destroy, {:id => photo.to_param}, valid_session
      }.to change(Photo, :count).by(0)
      end
    end

    context "with admin user" do
      before { sign_in(admin) }

      it "destroys the requested photo" do
        photo = Photo.create! valid_attributes
        expect {
          delete :destroy, {:id => photo.to_param}, valid_session
        }.to change(Photo, :count).by(-1)
      end

      it "redirects to the photos list" do
        photo = Photo.create! valid_attributes
        delete :destroy, {:id => photo.to_param}, valid_session
        expect(response).to redirect_to(photos_url)
      end
    end
  end

end
