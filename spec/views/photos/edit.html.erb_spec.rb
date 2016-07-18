require 'rails_helper'

RSpec.describe "photos/edit", type: :view do
  before { @photo = assign(:photo, create(:remote_photo)) }
  after { Photo.destroy_all}

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do
    end
  end
end
