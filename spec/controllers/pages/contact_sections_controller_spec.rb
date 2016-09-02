require 'rails_helper'

RSpec.describe Pages::ContactSectionsController, type: :controller do
  let(:contact_section) { create(:contact_section) }

  let(:valid_attributes) do
    attributes_for(:contact_section, email: "new@email.com")
  end

  let(:invalid_attributes) do
    attributes_for(:contact_section, email: "not_an_email")
  end

  let(:admin) { create(:admin) }

  describe "PUT update" do
    context "when user is not a logged in admin" do
      it "does not update the text" do
        email = contact_section.email
        put :update,
            id: contact_section.to_param,
            contact_section: valid_attributes

        contact_section.reload
        expect(contact_section.email).to eql(email)
      end
    end

    context "when user is admin" do
      before { sign_in(admin) }

      context "with valid params" do
        it "assigns the new section as @contact_section" do
          put :update,
              id: contact_section.to_param,
              contact_section: valid_attributes

          expect(assigns(:contact_section)).to eq(contact_section)
        end

        it "updates the text" do
          put :update,
              id: contact_section.to_param,
              contact_section: valid_attributes

          contact_section.reload
          expect(contact_section.email).to eql("new@email.com")
        end

        it "redirects to the contact page" do
          put :update,
              id: contact_section.to_param,
              contact_section: valid_attributes

          expect(response).to redirect_to(pages_contact_path)
        end
      end

      context "with invalid params" do
        it "does not update the contact section" do
          email = contact_section.email
          put :update,
              id: contact_section.to_param,
              contact_section: invalid_attributes

          contact_section.reload
          expect(contact_section.email).to eql(email)
        end

        it "redirects to the contact page" do
          put :update,
              id: contact_section.to_param,
              contact_section: invalid_attributes
          expect(response).to redirect_to(pages_contact_path)
        end
      end
    end
  end
end
