class ChartService

  def initialize(time_period: 'm', date_from: (Date.current - 1.year), date_to: Date.current, customer: nil, use_sector: nil)
    @time_period = time_period
    @date_from   = date_from
    @date_to     = date_to
    @customer    = customer
    @use_sector  = use_sector

    prepare_columns(consumptions)
  end

  def chart_columns
    [ChartColumnsService.new, ChartColumnsService.new]
  end

  private

    def consumptions
      @consumptions ||= Consumption.where(
        effective_date: date_from..date_to,
        use_sector_id: use_sector.id,
        customer_id: customer.id
      )
    end

    def prepare_columns(consumptions)
      #@chart_columns ||= Consumption.where(use_sector)
    end

    def customer
      @customer
    end

    def use_sector
      @use_sector
    end

    def date_from
      @date_from
    end

    def date_to
      @date_to
    end

    def time_period
      @time_period
    end
end
