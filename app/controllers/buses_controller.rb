class BusesController < ApplicationController
	before_action :find_bus, only: [:show, :edit, :destroy, :update]

	def index
		@buses = Bus.all
	end

	def new
		@franchises = Franchise.all
		@bus = Bus.new
	end

	def create
		@franchises = Franchise.all
		@bus = Bus.new(bus_params)
		@bus.franchise = Franchise.find(params[:bus][:franchise])
		if @bus.save
			redirect_to @bus
		else
			render 'new'
		end
	end

	def update
		@bus.franchise = Franchise.find(params[:bus][:franchise])
		if @bus.update(bus_params)
			redirect_to @bus
		else
			render 'edit'
		end
	end

	def edit
		@franchises = Franchise.all
	end

	def destroy
		@bus.destroy
		redirect_to buses_path
	end

	private

	def find_bus
		@bus= Bus.find(params[:id])
	end

	def bus_params
		params.require(:bus).permit(:name, :description)
	end
end
