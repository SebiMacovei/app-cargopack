class ExpensesController < ApplicationController
  def index
    expense = Expense.all
    render json: expense.to_json(:include => [:expense_type, :user, :trip])
  end
  def find_by_id
    expense=Expense.find(params[:id])
    render json: expense.to_json(:include => [:expense_type, :user, :trip])
  end
  def create
    expense = Expense.create(expense_params)
    render json: expense
  end

  def update
    expense = Expense.find(params[:id])
    expense.update(expense_params)
    render json: expense
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    render json: expense
  end

  def expense_params
    params.require(:expense)
          .permit(:user_id, :trip_id, :expense_type_id, :value)
  end
end
