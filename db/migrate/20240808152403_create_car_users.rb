class CreateCarUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :car_users do |t|
      t.belongs_to :car
      t.belongs_to :user
      t.timestamps
    end
  end
end
