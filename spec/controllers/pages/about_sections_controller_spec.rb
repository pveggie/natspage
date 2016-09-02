require 'rails_helper'

RSpec.describe Pages::AboutSectionsController, focus: true do
  let(:about_section) { create(:about_section) }

  let(:valid_attributes) { attributes_for(:about_section, header: "Updated")}
  let(:invalid_attributes) { attributes_for(:about_section, header: nil) }

  let(:admin) { create(:admin) }

  describe "PUT update" do
    context "when user is not a logged in admin" do

      it "does not update the text" do
        header = about_section.header
        put :update,
          {
            id: about_section.to_param,
            about_section: valid_attributes
          }
        about_section.reload
        expect(about_section.header).to eql(header)
      end
    end

    context "when user is admin" do
      before { sign_in(admin) }

      context "with valid_params" do
        it "assigns the new section as @about_section" do
          put :update, { id: about_section.to_param, about_section: valid_attributes }
          expect(assigns(:about_section)).to eq(about_section)
        end

        it "updates the text" do
          put :update, { id: about_section.to_param, about_section: valid_attributes }
          about_section.reload
          expect(about_section.header).to eql("Updated")
        end

        it "redirects to the about page" do
          put :update, {id: about_section.to_param, about_section: valid_attributes }
          expect(response).to redirect_to(pages_about_path)
        end
      end

      context "with invalid params" do
        it "does not update the about section" do
          header = about_section.header
          put :update,
            {
              id: about_section.to_param,
              about_section: invalid_attributes
            }
          about_section.reload
          expect(about_section.header).to eql(header)
        end

        it "redirects to the about page" do
          put :update, { id: about_section.to_param, about_section: invalid_attributes }
          expect(response).to redirect_to(pages_about_path)
        end
      end
    end
  end
end
