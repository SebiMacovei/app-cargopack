class Trip < ApplicationRecord
  belongs_to :destination
  has_many :expenses
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :users
end
