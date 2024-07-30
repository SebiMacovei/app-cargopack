class AddCarToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :current_car, index: true
    add_foreign_key :users, :cars, column: :current_car_id
  end
end
