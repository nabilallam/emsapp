class ConsumptionChartsController < ApplicationController
  def index
    @use_sectors = UseSector.where(id: 1)
    @chart_service = ChartService.new(customer: current_customer, use_sectors: @use_sectors)
  end
end
