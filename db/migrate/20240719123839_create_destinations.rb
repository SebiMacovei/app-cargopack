class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :name,  null: false, default: ""
      t.integer :destination_type,  null: false, default: 0
      t.timestamps
    end
    Destination.create :name => "Romania", :destination_type => 0
    Destination.create :name => "Italia", :destination_type => 1

  end
end
