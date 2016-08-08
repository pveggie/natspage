require 'rails_helper'

RSpec.describe AboutSectionsController, type: :routing do
  describe 'routing' do
    it 'routes to #update' do
      expect(put: 'about_sections/1')
        .to route_to('about_sections#update', id: '1')
      expect(patch: 'about_sections/1')
        .to route_to('about_sections#update', id: '1')
    end
  end
end
