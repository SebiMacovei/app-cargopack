class Car < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :packages
  has_and_belongs_to_many :trips
  has_many :clients
  belongs_to :extension
end
