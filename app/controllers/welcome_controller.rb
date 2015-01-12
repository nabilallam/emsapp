class WelcomeController < ApplicationController
  restrict_access_to Admin, User
  def index
    redirect_to(after_sign_in_path_for(current_user)) if current_user
  end
end
