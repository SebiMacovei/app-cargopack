class CarsController < ApplicationController
  def index
    car = Car.all
    render json: car
  end
  def find_by_id
    car = Car.find(params[:id])
    render :json => car
  end
  def create
    car = Car.create(car_params)
    render json: car
  end

  def update
    car = Car.find(params[:id])
    car.update(car_params)
    render json: car
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    render json: car
  end

  def car_params
    params.require(:car)
          .permit(:name, :plate_number, :license,:extention_id,:max_weight)
  end
end
