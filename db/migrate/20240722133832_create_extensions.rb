class CreateExtensions < ActiveRecord::Migration[7.0]
  def change
    create_table :extensions do |t|
      t.string :extension_type, null: false, default: ""
      t.string :plate_number,null: false, default: ""
      t.timestamps
    end
  end
end
