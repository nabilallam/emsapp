class ApplicationController < ActionController::Base
  class << self
    protected

    def restrict_access_to(*roles)
      before_action {
        authenticate_user!
        redirect_to(after_sign_in_path_for(current_user)) unless roles.include?(current_user.class)
      }
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_customer
  def current_customer
    current_source = current_user || current_manager
    @current_customer ||= current_source.customer
  end


  def after_sign_in_path_for(devise_resource)
    case devise_resource
    when :management, Manager
      management_customer_dashboard_path(devise_resource.customer_id)
    when :user, User
      customer_consumptions_path(devise_resource.customer_id)
    else
      root_path
    end
  end
end
