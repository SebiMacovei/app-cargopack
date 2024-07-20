class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name,null: false, default: ""
      t.string :pick_up_address,null: false, default: ""
      t.string :drop_off_address, null: false, default: ""
      t.string :phone, null: false, default: ""
      t.boolean :paid, null: false, default: false
      t.float :paid_value, null: false, default: 0.0
      t.belongs_to :client_type
      t.timestamps
    end
  end
end
