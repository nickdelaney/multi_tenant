class TransactionsController < ApplicationController

	def index
		@transactions = Transaction.where(user_id: current_user.id)
	end

	def show
		@transaction = Transaction.where(user_id: current_user.id, id: params[:id])
	end
end
