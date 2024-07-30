class PackagesController < ApplicationController
  def index
    package = Package.all
    render json: package.to_json(:include => [:giver,:receiver,:passenger,:current_car])
  end
  def find_by_id
    expense=Expense.find(params[:id])
    render json: expense.to_json(:include => [:giver,:receiver,:passenger,:current_car])
  end
  def create
    package = Package.create(post_params)
    render json: package
  end

  def update
    package = Package.find(params[:id])
    package.update(post_params)
    render json: package
  end

  def destroy
    package = Package.find(params[:id])
    package.destroy
    render json: package
  end

  def post_params
    params.require(:package)
          .permit(:giver_id, :receiver_id, :passenger_id, :number_load, :weight, :paid, :paid_value)
  end
end
