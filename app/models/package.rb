class Package < ApplicationRecord
  belongs_to :client
  has_and_belongs_to_many :cars
  belongs_to :current_car, class_name: "Car"
  belongs_to :giver, class_name: "Client"
  belongs_to :receiver, class_name: "Client"
  belongs_to :passenger, class_name: "Client"
end
