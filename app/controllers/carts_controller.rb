class CartsController < ApplicationController
	before_action :authenticate_user!

	def index
		@cart_items = Cart.where(user_id: current_user.id, franchise_id: current_franchise)
	end

	def new
		@cart = Cart.new
	end

	def create
		@cart = Cart.new(cart_params)
		if @cart.save
			redirect_to shoppingcart_path
		else
			render 'new'
		end
	end

	def destroy
		@cart = Cart.find(params[:id])
		if @cart.destroy
			redirect_to shoppingcart_path
		else
			redirect_to shoppingcart_path
		end
	end

	def checkout
		@cart_items = Cart.where(user_id: current_user.id, franchise_id: current_franchise)
	end

	def checkoutCart
		@total = Array.new
		@credits = Array.new
		@cart_items = Cart.where(user_id: current_user, franchise_id: current_franchise)
		@cart_items.each do |item|
			if item.product.type_id = '1'
				@credits.push item.quantity.to_i
			end
			if item.quantity.to_i < 4
				@cost = '12'
			else
				@cost = '10'
			end

			@item_total = item.quantity.to_i * @cost.to_i
			@total.push @item_total
		end

		@response =	@cim.create_customer_profile_transaction(
					:transaction => {
						:type => :auth_only,
						:amount => @total.sum.to_i,
						:customer_profile_id => current_user.customer_profile_id,
						:customer_payment_profile_id => current_user.payment_profile_id
						})
			if @response.success?
				@totalcredits = @credits.sum
					@credits = Credit.new(:franchise_id => current_user.franchise_id, :count => @credits.sum, :user_id => current_user.id)
					@transaction = Transaction.new(:amount => @total.sum.to_i, :user_id => current_user.id, :franchise_id => current_user.franchise_id, :tran_id => @response.params['direct_response']['transaction_id'], :description => "Reloaded #{@totalcredits}  credits to profile")
					@transaction.save
					if @credits.save
						flash[:notice] = "Credits added!"
						redirect_to root_path
						Cart.destroy_all(:user_id => current_user.id)
					else
						flash[:notice] = "There was an error with the purchase"
						redirect_to checkout_path
					end
				else
					flash[:notice] = "There was an error with the purchase"
					redirect_to checkout_path
					
			end
	end

	private
	def cart_params
		params.require(:cart).permit(:quantity,:product_id).merge(franchise_id: current_franchise, user_id: current_user.id)
	end

end
