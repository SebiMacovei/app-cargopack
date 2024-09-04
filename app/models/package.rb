class Package < ApplicationRecord
  has_and_belongs_to_many :cars
  belongs_to :current_car, class_name: "Car", optional: true
  belongs_to :giver, class_name: "Client", optional: true
  belongs_to :receiver, class_name: "Client", optional: true
  belongs_to :passenger, class_name: "Client", optional: true
  has_many_attached :images
end
