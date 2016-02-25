require 'spec_helper'

RSpec.describe ChartJsonService do
  describe '#data_array' do
    it 'return an array with a combination of year and moth between two dates' do
      date_points = (1..12).map{ |x| [Date.today.year, x] }
      prepared_data = (2..10).each_with_object([]) do |i, collector|
        y, m = Date.today.year, i
        amount = 200

        collector << {'year' => y, 'month' => m, 'amount' => amount}
      end

      chart_json = ChartJsonService.new(date_points: date_points, prepared_data: prepared_data, presented_data_name: 'strom')

      expect(chart_json.data_array).to eql(['strom', 0, 200, 200, 200, 200, 200, 200, 200, 200, 200, 0, 0])
    end
  end

  describe '#columns' do
    it 'return arrays as needed for c3 library' do
      date_points = (1..12).map{ |x| [Date.today.year, x] }
      prepared_data = (2..10).each_with_object([]) do |i, collector|
        y, m = Date.today.year, i
        amount = 200

        collector << {'year' => y, 'month' => m, 'amount' => amount}
      end

      chart_json = ChartJsonService.new(date_points: date_points, prepared_data: prepared_data, presented_data_name: 'strom')

      expect(chart_json.columns).to eql([
        ['x', '2016-1-1', '2016-2-1', '2016-3-1', '2016-4-1', '2016-5-1', '2016-6-1', '2016-7-1',
         '2016-8-1', '2016-9-1', '2016-10-1', '2016-11-1', '2016-12-1'],
        ['strom', 0, 200, 200, 200, 200, 200, 200, 200, 200, 200, 0, 0]
      ])
    end
  end
end
