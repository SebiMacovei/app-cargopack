class CreateExpenseTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_types do |t|
      t.string :name, null: false, default: ""
      t.timestamps
    end
    ExpenseType.create name: "gas"
    ExpenseType.create name: "telepas"
    ExpenseType.create name: "food"
    ExpenseType.create name: "paycheck"
    ExpenseType.create name: "commission"
  end
end
