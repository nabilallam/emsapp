class Management::BaseController < ApplicationController
  restrict_access_to Manager
end
