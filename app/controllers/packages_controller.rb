class PackagesController < ApplicationController
  def index
    package = Package.order(created_at: :desc)
    package_with_images = package.do |package|
      if package.images.attached?
        package.as_json(:include => :current_car).merge(package_images: url_for(package.images))
      else
        package.as_json(:include => :current_car).merge(package_images: nil)
      end
    render json: package_with_images.to_json(:include => [:giver,:receiver,:passenger,:current_car])
  end
  def find_by_id
    expense=Expense.find(params[:id])
    render json: expense.to_json(:include => [:giver,:receiver,:passenger,:current_car])
  end
  def create
    package = Package.create(package_params)
    render json: package
  end

  def update
    package = Package.find(params[:id])
    package.update(package_params)
    render json: package
  end

  def destroy
    package = Package.find(params[:id])
    package.destroy
    render json: package
  end

  def package_params
    params.require(:package)
          .permit(:giver_id, :receiver_id, :passenger_id, :number_load, :weight, :paid, :paid_value, images:[])
  end
end
