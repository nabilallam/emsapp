module ApplicationHelper
  def active_link?(source_controller)
    case source_controller
    when 'consumptions'
      'active' if params[:controller] == source_controller
    when 'consumption_charts'
      'active' if params[:controller] == source_controller
    end
  end
end
