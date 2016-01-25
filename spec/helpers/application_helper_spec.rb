require 'rails_helper'

RSpec.describe  ApplicationHelper do
    it 'returns active to the html-element if the clicked controller is the expected one' do
      allow_any_instance_of(ApplicationHelper).to receive(:params).and_return({controller: 'consumptions'})
      allow(helper).to receive(:xx).and_return('yy')

      expect(active_link?('consumptions')).to eql 'active'
    end
end
