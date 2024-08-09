class TripsController < ApplicationController
  def index
    trip = Trip.all
    render json: trip.to_json(:include => :destination)
  end

  def find_by_id
    trip = Trip.find(params[:id])
    render json: trip.to_json(:include => :destination)
  end

  def create
    destination_tur_id = Destination.find_by(:destination_type => 1).id
    destination_retur_id = Destination.find_by(:destination_type => 0).id
    car_ids = params[:selectedCars_data].map{|car| car[:car_id]}
    params[:selectedCars_data].each{|car|
      car_per_list = car[:car_id]
      car_object = Car.find(car_per_list)
      user_ids_per_car = car[:users].map{|user| user[:id]}
      users_object = User.find(user_ids_per_car)
      car_object.users << users_object
    }
    selected_cars = Car.find(car_ids)
    tur_data = {
      start_date: params[:tur_data][:start_tur_date],
      end_date: params[:tur_data][:end_tur_date],
      destination_id: destination_tur_id,
    }
    retur_data = {
      start_date: params[:retur_data][:start_retur_date],
      end_date: params[:retur_data][:end_retur_date],
      destination_id: destination_retur_id
    }
    trip_tur = Trip.create(tur_data) #.permit(:start_date, :end_date, :destination_id)
    trip_tur.cars << selected_cars
    trip_retur = Trip.create(retur_data) #.permit(:start_date, :end_date, :destination_id)
    trip_retur.cars << selected_cars
    all_Data = {
      trip_tur: JSON.parse(trip_tur.to_json(:include =>{
        :cars => {:include => :users},
        :destination => {}
      })),
      trip_retur: JSON.parse(trip_retur.to_json(:include =>{
        :cars => {:include => :users},
        :destination => {}
      })),
    }
    render json: all_Data
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
