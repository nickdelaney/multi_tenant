class FranchisesController < ApplicationController
<<<<<<< HEAD
=======
	before_action :find_franchise, only: [:show, :edit, :destroy, :update]
	before_action :find_buses, only: [:show]
	before_action :find_preschools, only: [:show]

	def index
		@franchises = Franchise.all

	end

	def show
		
	end

	def new
		@franchise = Franchise.new
	end

	def create
		@franchise = Franchise.new(franchise_params)
		if @franchise.save
			redirect_to @franchise
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @franchise.update(franchise_params)
			redirect_to @franchise
		else
			render 'edit'
		end
	end

	def destroy
		@franchise.destroy
		redirect_to root_path
	end

	private

	def find_franchise
		@franchise = Franchise.find(params[:id])
	end

	def find_buses
		@buses = Bus.where(franchise_id: params[:id])
	end

	def find_preschools
		@preschools = Preschool.where(franchise_id: params[:id])
	end

	def franchise_params
		params.require(:franchise).permit(:name, :description)
	end

>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
end
