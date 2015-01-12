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

    it 'assigns @consumptions' do
      5.times do
        FactoryGirl.create(:consumption, customer: user.customer)
      end
      consumptions = Consumption.where(customer_id: user.customer_id)
      get :index, customer_id: user.customer_id
      expect(assigns(:consumptions)).to eq(consumptions)
    end
  end
end
