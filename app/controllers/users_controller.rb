class UsersController < ApplicationController
  def index
    render :json => User.all
  end

  def create
    user = User.create(post_params)
    render :json => user
  end

  def update
    user= User.find(params[:id])
    user.update(post_params)
    render :json => user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render :json => user
  end

  def post_params
    params.require(:user).permit(:phone, :name)
  end
end
