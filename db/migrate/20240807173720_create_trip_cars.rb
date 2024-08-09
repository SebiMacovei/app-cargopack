class CreateTripCars < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_cars do |t|
      t.belongs_to :trip
      t.belongs_to :car
      t.timestamps
    end
  end
end
