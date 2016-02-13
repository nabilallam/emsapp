class ChartService

  def initialize(time_unit: 'm', date_from: (Date.current - 1.year), date_to: Date.current, customer: nil, use_sectors: nil)
    @time_unit   = time_unit
    @date_from   = date_from
    @date_to     = date_to
    @customer    = customer
    @use_sectors  = use_sectors
  end

  def chart_columns
    @chart_columns ||= initialize_columns
  end

  private

    def consumptions
      @consumptions ||= Consumption.where(
        effective_date: date_from..date_to,
        use_sector_id: use_sectors.pluck(:id),
        customer_id: customer.id
      )
    end

    def prepared_consumptions
      @prepared_consumptions ||= prepare
    end

    def prepare
      consumptions.select(data_selection)
        .group(data_grouping).order(data_grouping)
    end

    def customer
      @customer
    end

    def use_sectors
      @use_sectors
    end

    def date_from
      @date_from
    end

    def date_to
      @date_to
    end

    def time_unit
      @time_unit
    end

    def data_points_count
      if time_unit == 'm'
        date_to.month - date_from.month + 1
      elsif time_unit == 'd'
        date_to - date_from.month + 1
      end
    end

    def data_selection
      if time_unit == 'm'
        extract_day = ''
      elsif time_unit == 'd'
        extract_day = 'CAST (EXTRACT (DAY FROM effective_date) AS INTEGER) AS day,'
      end

      extract_day + 'CAST (EXTRACT (MONTH FROM effective_date) AS INTEGER) AS month,
         CAST (EXTRACT (YEAR FROM effective_date) AS INTEGER) AS year,
         sum(amount) as amount'
    end

    def data_grouping
      if time_unit == 'm'
        'year, month'
      elsif time_unit == 'd'
        'year, month, day'
      end
    end
end
