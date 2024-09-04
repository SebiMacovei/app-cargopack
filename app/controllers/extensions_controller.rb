class ExtensionsController < ApplicationController
  def index
    extension = Extension.all
    render json: extension
  end

  def find_by_id
    extension = Extension.find(params[:id])
    render json: extension
  end

  def create
    extension = Extension.create(extension_params)
    render json: extension
  end

  def update
    extension = Extension.find(params[:id])
    extension.update(extension_params)
    render json: extension
  end

  def destroy
    extension = Extension.find(params[:id])
    extension.destroy
    render json: extension
  end

  def extension_params
    params.require(:extension)
          .permit(:extension_type, :plate_number)
  end
end
