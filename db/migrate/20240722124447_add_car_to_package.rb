class AddCarToPackage < ActiveRecord::Migration[7.0]
  def change
    add_reference :packages, :current_car, index: true
    add_foreign_key :packages, :cars, column: :current_car_id
  end
end
