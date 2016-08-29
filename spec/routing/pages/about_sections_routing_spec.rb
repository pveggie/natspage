require 'rails_helper'

RSpec.describe Pages::AboutSectionsController, type: :routing do
  describe 'routing' do
    it 'routes to #update' do
      expect(put: 'pages/about_sections/1')
        .to route_to('pages/about_sections#update', id: '1')
      expect(patch: 'pages/about_sections/1')
        .to route_to('pages/about_sections#update', id: '1')
    end
  end
end
