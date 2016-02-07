require 'spec_helper'

RSpec.describe  ApplicationHelper do
    it 'returns active to the html-element if the clicked controller is the expected one' do
      allow(helper).to receive(:params).and_return({controller: 'consumptions'})

      expect(helper.active_link?('consumptions')).to eql 'active'
    end
end
