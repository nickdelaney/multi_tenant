class Admin::PreschoolsController < ApplicationController
	before_action :find_preschool, only:[:show, :edit, :destroy, :update]
	before_action :all_preschools, only:[:index]

	def index
	end

	def show
	end

	def new
		@preschool = Preschool.new
	end

	def create
		@preschool = Preschool.new(preschool_params)
		if @preschool.save
			redirect_to admin_preschool_path(@preschool)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @preschool.update(preschool_params)
			redirect_to admin_preschools_path(@preschool)
		else
			render 'edit'
		end
	end

	def destroy
		@preschool.destroy
		redirect_to admin_preschools_path
	end

	private

	def find_preschool
		@preschool = Preschool.find_by(id: params[:id], franchise_id: current_franchise)
	end

	def all_preschools
		@preschools = Preschool.where(franchise_id: current_franchise)
	end

	def preschool_params
		params.require(:preschool).permit(:name,:description,:address_1,:address_2,:city,:state,:zip,:phone,:director).merge(franchise_id: current_franchise)
	end
end
