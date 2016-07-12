require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before do
    assign(:categories, [
      create(:category),
      create(:category)])
    assign(:photos, [
      create(:local_photo, categories: [Category.first]),
      create(:local_photo, categories: [Category.second])
    ])

  end

  after { Photo.destroy_all }

  it "renders a list of photos" do
    render
  end
end
