class ClientsController < ApplicationController

  def index
    clients = Client.all
    render json: clients.to_json(:include => :client_type)
  end
  def find_by_id
    client = Client.find(params[:id])
    render :json => client.to_json(:include => :client_type)
  end
  def create
    client = Client.create(post_params)
    render json: client
  end

  def update
    client = Client.find(params[:id])
    client.update(post_params)
    render json: client
  end

  def destroy
    client = Client.find(params[:id])
    client.destroy
    render json: client
  end

  def post_params
    params.require(:client)
          .permit(:name, :pick_up_address, :drop_off_address, :phone, :client_type_id, :paid, :paid_value)
  end
end
