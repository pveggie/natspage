require 'rails_helper'

RSpec.describe Pages::ContactSectionsController, type: :routing do
  describe 'routing' do
    it 'routes to #update' do
      expect(put: 'pages/contact_sections/1')
        .to route_to('pages/contact_sections#update', id: '1')
      expect(patch: 'pages/contact_sections/1')
        .to route_to('pages/contact_sections#update', id: '1')
    end
  end
end
