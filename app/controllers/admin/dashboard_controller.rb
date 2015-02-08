class Admin::DashboardController < ApplicationController
	before_action :check_role
  def index
  end
end
