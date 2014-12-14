class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @hotels = Hotel.all
    respond_with(@hotels)
  end

  def show
    respond_with(@hotel)
  end

  def new
    @hotel = Hotel.new
    respond_with(@hotel)
  end

  def edit
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.save
    respond_with(@hotel)
  end

  def update
    @hotel.update(hotel_params)
    respond_with(@hotel)
  end

  def destroy
    @hotel.destroy
    respond_with(@hotel)
  end

  private
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit(:name)
    end
end
