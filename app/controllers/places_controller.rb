class PlacesController < ApplicationController

	def index
		#@places = Place.all
		@places = Place.order("name").page(params[:page]).per(2)
	end

	def new
		@place = Place.new
	end

	def create
		Place.create(place_params)
		redirect_to root_path
	end

	private 

	def place_params
		params.require(:place).permit(:name, :address, :description)
	end


end
