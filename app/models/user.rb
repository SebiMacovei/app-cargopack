class User < ApplicationRecord
  has_and_belongs_to_many :trips
  has_many :expenses
  has_many :car_users
  has_many :cars, through: :car_users
  has_one_attached :avatar
  belongs_to :current_car, class_name: "Car", optional: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null
end
