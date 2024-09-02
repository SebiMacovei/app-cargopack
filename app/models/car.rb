class Car < ApplicationRecord
  has_and_belongs_to_many :packages
  has_many :trip_cars
  has_many :trips, through: :trip_cars

  has_many :car_users
  has_many :users, through: :car_users

  belongs_to :extension
end
