class PreschoolsController < ApplicationController
<<<<<<< HEAD
=======
	before_action :find_preschool, only: [:show, :edit, :destroy, :update, :find_franchise]
	before_action :get_relationships, only: [:show]


	def index
		@preschools = Preschool.all
	end
	
	def show
		
	end
	
	def new
		@franchises = Franchise.all
		@preschool = Preschool.new
	end

	def create
		@franchises = Franchise.all
		@preschool = Preschool.new(preschool_params)
		@preschool.franchise = Franchise.find(params[:preschool][:franchise])
		if @preschool.save
			redirect_to @preschool
		else
			render 'new'
		end
	end

	def edit
		@franchises = Franchise.all
	end

	def update
		@franchises = Franchise.all
		@preschool.franchise = Franchise.find(params[:preschool][:franchise])
		if @preschool.update(preschool_params)
			redirect_to @preschool
		else
			render 'edit'
		end
	end

	def destroy
		@preschool.destroy
		redirect_to preschools_path
	end

	private

	def find_preschool
		@preschool= Preschool.find(params[:id])
	end

	def get_relationships
		@franchise = Franchise.find(@preschool.franchise_id)
		@students = Student.where(preschool_id: params[:id])
		@sections = Section.where(preschool_id: params[:id])
	end

	

	def preschool_params
		params.require(:preschool).permit(:name, :description, :address_1, :address_2, :city, :state, :zip, :phone, :director)
	end

>>>>>>> 59ae499b83e751e8276da80321f5d08ce2d964a7
end
