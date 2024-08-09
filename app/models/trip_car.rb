class TripCar < ApplicationRecord
  belongs_to :trip
  belongs_to :car
end
