require 'spec_helper'

RSpec.describe ChartService do
  describe '#chart_columns' do
    it 'returns an array of columns' do
      chart_service = ChartService.new

      expect(chart_service.chart_columns.first.class.name).to eql 'ChartColumnsService'
    end
  end

  describe '#consumptions' do
    it 'returns consumptions for a customer for a use_sector' do
      customer   = FactoryGirl.create(:customer)
      location   = FactoryGirl.create(:location, customer: customer)
      use_sector = FactoryGirl.create(:use_sector)
      resource   = FactoryGirl.create(:resource)
      create_customer_consumptions(customer, location, use_sector, resource)

      values = {customer: customer, location: location, use_sector: use_sector, resource: resource}
      consumption = FactoryGirl.create(
        :consumption,
        {effective_date: DateTime.current.end_of_month - 13.months,
         name: 'Verbrauch 1', amount: 222.22}.merge(values)
      )

      chart_service = ChartService.new(customer: customer, use_sector: use_sector)

      expect(chart_service.send(:consumptions)).not_to include(consumption)
      expect(chart_service.send(:consumptions).count).to eql 10
      expect(chart_service.send(:consumptions).sum(:amount)).to eql(10 * 111.11)
    end
  end
end

def create_customer_consumptions(customer, location, use_sector, resource)
  values = {customer: customer, location: location, use_sector: use_sector, resource: resource}
  10.times.each_with_index do |i|
    FactoryGirl.create(
      :consumption,
      {effective_date: DateTime.current - i.month,
       name: 'Verbrauch 1', amount: 111.11}.merge(values)
    )
  end
end