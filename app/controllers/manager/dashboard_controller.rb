class Manager::DashboardController < ApplicationController
  layout 'admin_panel'
  def index
    @hotels = current_user.hotels
  end
end
