class Admin::BusesController < AdminController
	before_action :find_bus, only:[:show, :edit, :destroy, :update]
	before_action :all_buses, only:[:index]
	before_action :check_role

	

	def index
		add_breadcrumb "Buses", :admin_buses_path
	end

	def new
		add_breadcrumb "Buses", :admin_buses_path
		add_breadcrumb "New", :new_admin_bus_path
		@bus = Bus.new
	end

	def create
		@bus = Bus.new(bus_params)
		if @bus.save
			redirect_to admin_bus_path(@bus)
			flash[:success] = 'Bus added!'
		else
			render 'new'
			flash[:error] = 'Trouble adding bus, please try again!'
		end
	end

	def show
	end

	def edit
		add_breadcrumb "Buses", :admin_buses_path
		add_breadcrumb "Edit", :edit_admin_bus_path
	end

	def update
		if @bus.update(bus_params)
			redirect_to admin_bus_path(@bus)
			flash[:success] = 'Bus updated!'
		else
			render 'edit'
			flash[:error] = 'Unable to update bus, please try again!'
		end
	end

	def destroy
		if @bus.destroy
			redirect_to admin_buses_path
			flash[:success] = 'Bus Removed!'
		else
			redirect_to admin_buses_path
			flash[:error] = 'Unable to remove bus, please try again!'
		end
	end

	private

	def find_bus
		@bus = Bus.find_by(id: params[:id], franchise_id: current_franchise)
	end

	def all_buses
		@buses= Bus.where(franchise_id: current_franchise)
	end

	def bus_params
		params.require(:bus).permit(:name,:description).merge(franchise_id: current_franchise)
	end

end
