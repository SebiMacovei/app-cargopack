class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.integer :number_load, null: false, default: 0
      t.boolean :paid, null: false, default: false
      t.float :paid_value, null: false, default: 0.0
      t.float :weight, null: false, default: 0.0
      t.belongs_to :giver, foreign_key: {to_table: :clients}
      t.belongs_to :receiver, foreign_key: {to_table: :clients}
      t.belongs_to :passenger, foreign_key: {to_table: :clients}
      t.timestamps
    end
  end
end
