require 'spec_helper'

RSpec.describe ConsumptionsController, :type => :controller do
  let!(:user) { FactoryGirl.create(:user) }
  before do
    sign_in user
  end

  describe  'GET index' do
    it 'render index' do
      get :index, customer_id: user.customer_id
      expect(response).to render_template('index')
    end

    describe 'assigning @consumptions' do
      before do
        5.times do
          FactoryGirl.create(:consumption, customer: user.customer)
        end
      end

      it 'assigns all consumptions' do
        consumptions = Consumption.where(customer_id: user.customer_id)
        get :index, customer_id: user.customer_id
        expect(assigns(:consumptions)).to match_array(consumptions)
      end

      it 'assigned @consumptions doesn\'t include consumptions from other customers' do
        other_customer = FactoryGirl.create(:customer)
        5.times do
          FactoryGirl.create(:consumption, customer: other_customer)
        end
        consumptions = Consumption.where(customer_id: other_customer.id)
        get :index, customer_id: user.customer_id
        expect(assigns(:consumptions)).not_to include(consumptions)
      end
    end
  end

  describe  'GET new' do
    let!(:use_sector) { FactoryGirl.create(:use_sector, customer: user.customer) }
    let!(:other_use_sector) { FactoryGirl.create(:use_sector, customer: user.customer) }

    it 'assingn use_sector consumptions' do
      5.times do
        FactoryGirl.create(:consumption, customer: user.customer, use_sector: use_sector)
      end
      consumptions = Consumption.where(use_sector_id: use_sector.id)
      other_consumption = FactoryGirl.create(:consumption, customer: user.customer, use_sector: other_use_sector)

      get :new, customer_id: user.customer_id, use_sector_id: use_sector.id

      expect(assigns(:consumption).attributes).to eq(Consumption.new(use_sector_id: use_sector.id).attributes)
      expect(assigns(:consumptions)).to match_array(consumptions)
      expect(assigns(:consumptions)).not_to include(consumptions)
    end

  end
end
