class CartsController < ApplicationController
	def new
		@cart = Cart.new
	end

	def create
		if @cart.save(cart_params)
			redirect_to users_path
		else
			render 'new'
		end
	end

	private


end
