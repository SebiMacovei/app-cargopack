class UsersController < ApplicationController
  def index
    users=User.order(created_at: :desc)
    users_with_avatar = users.map do |user|
      if user.avatar.attached?
        user.as_json(:include => :current_car).merge(avatar_image: url_for(user.avatar))
      else
        user.as_json(:include => :current_car).merge(avatar_image: nil)
      end
    end
    render :json => users_with_avatar
  end

  def get_current_user
    render json: current_user.as_json.merge(avatar_image: current_user.avatar.attached? ? url_for(current_user.avatar) : nil )
  end
  def find_by_id
    user = User.find(params[:id])
    render :json => user.to_json(:include => :current_car)
  end
  def create
    user = User.create(user_params)
    render :json => user
  end

  def update
    user= User.find(params[:id])
    user.update(user_params)
    render :json => user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render :json => user
  end

  def user_params
    params.require(:user).permit(:phone, :name, :avatar)
  end
end
