require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before do
    assign(:categories, [
      create(:category),
      create(:category)])
    assign(:photos, [
      create(:photo, categories: [Category.first]),
      create(:photo, categories: [Category.second])
    ])

  end

  it "renders a list of photos" do
    render
  end
end
