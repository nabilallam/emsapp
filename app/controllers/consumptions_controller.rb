class ConsumptionsController < ApplicationController
  before_filter :select_consumptions
  before_filter :prepare_new_form, only: [:edit, :new]
  before_filter :get_use_sector, only: [:edit, :new, :updaet, :create]

  def new
    @consumption = Consumption.new(use_sector: @use_sector)
  end

  def create
    @consumption = Consumption.new(consumption_params)
    @consumption.customer_id = @current_user.customer_id
    unless @consumption.save
      render :new
    else
      redirect_to new_customer_consumption_path(current_user.customer_id, use_sector_id: params[:consumption][:use_sector_id])
    end
  end

  def edit
    @consumption = Consumption.find(params[:id])
    @consumptions = @consumptions.where.not(id: params[:id])
  end

  def update
    @consumption = Consumption.where(id: params[:id]).first
    @consumption.update_attributes(consumption_params)
    render :edit
    #redirect_to edit_customer_consumption_path(@current_user.customer_id, @consumption, use_sector_id: @consumption.use_sector_id)
  end

  private

  def prepare_new_form()
    @consumptions = @consumptions.where(use_sector_id: params[:use_sector_id]).order('created_at DESC').limit(10)
    @locations = Location.where(customer_id: @current_user.customer_id)
    @resources = Resource.joins(:customer_resources_use_sectors).
      where('customer_resources_use_sectors.use_sector_id = ? AND customer_resources_use_sectors.customer_id = ?', params[:use_sector_id], self.current_user.customer_id)
  end

  def consumption_params
    params.require(:consumption).permit(
      :name,
      :resource_id,
      :location_id,
      :use_sector_id,
      :name,
      :co2_factor,
      :amount,
      :effective_date,
    )
  end

  def select_consumptions
    @consumptions = Consumption.includes(:resource, :use_sector).where(customer_id: current_user.customer_id)
  end

  def get_use_sector
    @use_sector = UseSector.where(id: params[:use_sector_id]).first
  end
end
