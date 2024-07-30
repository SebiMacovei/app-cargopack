class Client < ApplicationRecord
  belongs_to :client_type
  has_many :packages
  has_and_belongs_to_many :trips
  belongs_to :car
end
