class Trip < ApplicationRecord
  belongs_to :destination
  has_many :expenses
  has_many :trip_cars
  has_many :cars, through: :trip_cars

  has_and_belongs_to_many :clients

  accepts_nested_attributes_for :destination, reject_if: :all_blank, allow_destroy: true
end
