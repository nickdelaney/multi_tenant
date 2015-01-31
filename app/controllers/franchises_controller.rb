class FranchisesController < ApplicationController
	before_action :find_franchise, only: [:show, :edit, :destroy, :update]

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

	def franchise_params
		params.require(:franchise).permit(:name, :description)
	end

end
