require "rails_helper"

RSpec.describe PagesController, type: :routing do
  describe "routing" do
    it "roots #about" do
      expect(:get => "pages/about").to route_to("pages#about")
    end

    # it "routes to #update" do
    #   expect(:put => "/abouts/1").to route_to("abouts#update", id: "1")
    #   expect(:patch => "/abouts/1").to route_to("abouts#update", id: "1")
    # end
  end
end

