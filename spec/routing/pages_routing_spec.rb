require "rails_helper"

RSpec.describe PagesController, type: :routing do
  describe "routing" do
    it "routes to #about" do
      expect(:get => "pages/about").to route_to("pages#about")
    end

    it "routes to #contact" do
      expect(:get => "pages/contact").to route_to("pages#contact")
    end
  end
end

