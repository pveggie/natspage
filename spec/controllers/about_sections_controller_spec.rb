require 'rails_helper'

RSpec.describe AboutSectionsController, focus: true do
  let(:valid_attributes) { attributes_for(:about_section, header: "Updated")}
  let(:invalid_attributes) { attributes_for(:about_section, header: nil) }

  let(:admin) { create(:admin) }

  describe "PUT update" do
    # context "when user is not a logged in admin" do

    #   it "does not update the text" do
    #   end

    #   it "stays on the about page" do
    #   end
    # end

    context "when user is admin" do
      before { sign_in(admin) }

      it "assigns the new section as @about_section" do
        admin_section = create(:admin_section)
        put :update, { id: admin_section.to_param, admin_section: valid_attributes }
        expect(assigns(:admin_section)).to eq(admin_section)
      end

      # it "updates the text" do
      # end

      # it "redirects to the about page" do
      # end
    end
  end
end


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
