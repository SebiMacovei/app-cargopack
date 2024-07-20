class CreateClientTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :client_types do |t|
      t.string :name,  null: false, default: ""
      t.timestamps
    end
    ClientType.create name: "giver"
    ClientType.create name: "receiver"
    ClientType.create name: "passenger"
  end
end
