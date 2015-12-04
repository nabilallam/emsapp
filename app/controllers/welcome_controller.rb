class WelcomeController < ApplicationController
  restrict_access_to Manager, User
  def index
    redirect_to(after_sign_in_path_for(current_user)) if current_user
    redirect_to(after_sign_in_path_for(current_manager)) if current_manager
  end
end
