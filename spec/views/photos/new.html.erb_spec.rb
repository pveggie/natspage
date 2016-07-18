require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before { assign(:photo, Photo.new) }

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do
    end
  end
end
