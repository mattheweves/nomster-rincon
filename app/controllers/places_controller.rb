class PlacesController < ApplicationController

	before_action :authenticate_user!, :only =>[:new, :create]
	def index
		#@places = Place.all
		@places = Place.order("name").page(params[:page]).per(2)
	end

	def new
		@place = Place.new
	end

	def create
		current_user.places.create(place_params)
		redirect_to root_path
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		#We should find the record the user wants to update.
		#We should update this record and save the changes the user specifies into our database.
		#We should send the user back to the root page.
		@place = Place.find(params[:id])
		@place.update_attributes(place_params)
		redirect_to root_path	
	end



	private 

	def place_params
		params.require(:place).permit(:name, :address, :description)
	end


end
