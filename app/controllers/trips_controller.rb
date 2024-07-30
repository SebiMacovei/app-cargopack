class TripsController < ApplicationController
  def index
    trip = Trip.all
    render json: trip.to_json(:include => :destination)
  end

  def find_by_id
    trip=Trip.find(params[:id])
    render json: trip.to_json(:include => :destination)
  end
  def create
    trip = Trip.create(post_params)
    render json: trip
  end

  def update
    trip = Trip.find(params[:id])
    trip.update(post_params)
    render json: trip
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    render json: trip
  end

  def post_params
    params.require(:trip)
          .permit(:start_date, :end_date, :destination_id)
  end
end
