class RemoveCarsUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :cars_users
  end
end
