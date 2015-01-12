class Admin::BaseController < ApplicationController
  restrict_access_to Admin
end
