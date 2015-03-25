class CreditsController < ApplicationController

	def new
		@products = Product.where(type_id: '1', franchise_id: current_franchise)
		@cart = Cart.new
	end

	def create
		
	end


	private

	def credit_params
		params.require(:credit).permit(:count).merge(franchise_id: current_franchise, user_id: current_user.id)
	end

end
