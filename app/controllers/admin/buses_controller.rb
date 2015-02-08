class Admin::BusesController < ApplicationController
	before_action :find_bus, only:[:show, :edit, :destroy, :update]
	before_action :all_buses, only:[:index]
	before_action :check_role

	def index
	end

	def new
		@bus = Bus.new
	end

	def create
		@bus = Bus.new(bus_params)
		if @bus.save
			redirect_to admin_bus_path(@bus)
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @bus.update(bus_params)
			redirect_to admin_bus_path(@bus)
		else
			render 'edit'
		end
	end

	def destroy
		@bus.destroy
		redirect_to admin_buses_path
	end

	private

	def find_bus
		@bus = Bus.find_by(id: params[:id], franchise_id: current_franchise)
	end

	def all_buses
		@buses= Bus.where(franchise_id: current_franchise)
	end

	def bus_params
		params.require(:bus).permit(:name,:description).merge(franchise_id: current_franchise)
	end

end
