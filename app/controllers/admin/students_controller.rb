class Admin::StudentsController < ApplicationController
	before_action :check_role
end
