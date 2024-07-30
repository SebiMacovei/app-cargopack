class CreateCarsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :cars_users do |t|
      t.belongs_to :cars
      t.belongs_to :users
      t.timestamps
    end
  end
end
