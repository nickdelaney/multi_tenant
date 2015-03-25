class Admin::TransactionsController < AdminController
	before_action :all_transactions, only:[:index]
	before_action :find_transaction, only:[:show, :edit, :update]

	def index
	end

	def show
		add_breadcrumb "Transaction", :admin_transaction_path
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end


	private

	def all_transactions
		@transactions = Transaction.where(franchise_id: current_franchise)
	end

	def find_transaction
		@transaction = Transaction.find_by(id: params[:id], franchise_id: current_franchise)
	end


end
