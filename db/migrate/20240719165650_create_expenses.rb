class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.float :value, null: false, default: 0.0
      t.belongs_to :expense_type
      t.belongs_to :user
      t.belongs_to :trip
      t.timestamps
    end
  end
end
