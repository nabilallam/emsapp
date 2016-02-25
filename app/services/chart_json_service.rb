class ChartJsonService
  attr_reader :presented_data_name

  def initialize(args)
    @date_points = args[:date_points]
    @prepared_data = args[:prepared_data]
    @presented_data_name = args[:presented_data_name]
  end

  def data_array
    @data_array ||= date_points.each_with_object([]) do |date, collector|
      collector << find_in_prepared_data(date)
    end.unshift(data_name_as_key)
  end

  def columns
    [x_array] << data_array
  end

  private

    def find_in_prepared_data(date)
      consumption_hash = prepared_data.find {|consumption| consumption['year'] == date[0] && consumption['month'] == date[1] } || {}
      collect_data_structure(consumption_hash)
    end

    def collect_data_structure(consumption_hash)
      #{'name' => "#{date[0]}-#{date[1]}-1", data_name_as_key => consumption_hash.fetch('amount', 0)}
      consumption_hash.fetch('amount', 0)
    end

    def date_points
      @date_points
    end

    def prepared_data
      @prepared_data
    end

    def presented_data_name
      @presented_data_name
    end

    def data_name_as_key
      presented_data_name.underscore
    end

    def x_array
      ['x'].concat(date_points.map{ |date| "#{date[0]}-#{date[1]}-1"})
    end
end
