require 'rails_helper'

RSpec.describe "Navbar", type: :view, focus:true do

  let(:admin) { create(:admin) }

  context "while not logged in as admin" do
    it "renders buttons for non-admin actions" do
      render partial: "shared/navbar.html.erb"

      expect(rendered).to match /Home/
      expect(rendered).to match /About/
      expect(rendered).to match /Contact/
    end

    it "does not render admin-only buttons" do
      render partial: "shared/navbar.html.erb"

      expect(rendered).to_not match /Add Photo/
    end
  end

  context "when logged in as admin" do
    before { sign_in(admin) }

    it "renders the admin-only buttons" do
      render partial: "shared/navbar.html.erb"

      expect(rendered).to match /Add Photo/
    end
  end
end
