require 'spec_helper'

RSpec.describe ApplicationController, :type => :controller do
  describe '#current_customer' do
    before { allow(controller).to receive(:current_customer).and_call_original}

    context 'user is logged in' do
      it 'returns the customer based on the logged in resource' do
        customer = FactoryGirl.create(:customer)
        user = FactoryGirl.create(:user, customer: customer)
        sign_in user

        expect(controller.current_customer.id).to eql customer.id
      end
    end

    context 'manager is logged in' do
      it 'returns the customer based on the logged in resource' do
        customer = FactoryGirl.create(:customer, name: 'Petros')
        manager = FactoryGirl.create(:manager, customer: customer)
        sign_in manager

        expect(controller.current_customer).to eql customer
      end
    end
  end
end
