require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:admin) { create(:admin) }

  describe "AboutPage" do
  # Admin user should be able to edit the default on the About page.
  # The can't create or delete the text.
  # The url should be /about
  # Editing of the text should be done within the about page with a from that
  # appears when the user clicks to edit.
  #
  let(:valid_about_attributes) { attributes_for(:about_section) }
  let(:invalid_about_attributes) { attributes_for(:about, content: nil)}

  let(:default_about) { create(:about_section) }


    # starting with single content box, but potentially could have multiple
    # will therefore use index
    describe "GET #about" do
      it "assigns all about sections as @about_sections" do
        get :about
        expect(assigns(:about_sections)).to eq([default_about])
      end
    end

    # describe "GET #edit" do
    #   context "when user is not logged in and admin", focus: true do
    #     it "redirects to the index" do
    #       photo = Photo.create! valid_attributes
    #       get :edit, {:id => photo.to_param}, valid_session
    #       expect(response).to redirect_to(photos_path)
    #     end
    #   end

    #   context "with admin user" do
    #     it "assigns the requested photo as @photo" do
    #       sign_in(admin)
    #       photo = Photo.create! valid_attributes
    #       get :edit, {:id => photo.to_param}, valid_session
    #       expect(assigns(:photo)).to eq(photo)
    #     end
    #   end
    # end

    # describe "PUT #update" do
    #   context "when user is not logged in and admin", focus: true do
    #     it "does not update the photo" do
    #       photo = Photo.create! valid_attributes
    #       title = Photo.first.caption_title
    #       put :update, {:id => photo.to_param, :photo => new_attributes}, valid_session
    #       expect(photo.caption_title).to eql(title)
    #     end
    #   end

    #   context "with admin user" do
    #     before { sign_in(admin) }

    #     context "with valid params" do
    #       it "updates the requested photo" do
    #         photo = Photo.create! valid_attributes
    #         put :update, {:id => photo.to_param, :photo => new_attributes}, valid_session
    #         photo.reload
    #         expect(photo.caption_title).to eql("changed title")
    #       end

    #       it "assigns the requested photo as @photo" do
    #         photo = Photo.create! valid_attributes
    #         put :update, {:id => photo.to_param, :photo => valid_attributes}, valid_session
    #         expect(assigns(:photo)).to eq(photo)
    #       end

    #       it "redirects to the index" do
    #         photo = Photo.create! valid_attributes
    #         put :update, {:id => photo.to_param, :photo => valid_attributes}, valid_session
    #         expect(response).to redirect_to(photos_path)
    #       end
    #     end

    #     context "with invalid params" do
    #       it "assigns the photo as @photo" do
    #         photo = Photo.create! valid_attributes
    #         put :update, {:id => photo.to_param, :photo => invalid_attributes}, valid_session
    #         expect(assigns(:photo)).to eq(photo)
    #       end

    #       it "re-renders the 'edit' template" do
    #         photo = Photo.create! valid_attributes
    #         put :update, {:id => photo.to_param, :photo => invalid_attributes}, valid_session
    #         expect(response).to render_template(:edit)
    #       end
    #     end
    #   end
    # end
  end
end
