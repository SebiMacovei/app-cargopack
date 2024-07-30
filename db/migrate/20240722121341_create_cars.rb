class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name, null: false, default: ""
      t.string :plate_number,null: false, default: ""
      t.boolean :license,null: false, default: false
      t.integer :max_weight,null: false, default: 0
      t.timestamps
    end
  end
end
