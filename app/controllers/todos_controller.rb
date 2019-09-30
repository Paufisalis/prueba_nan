class TodosController < ApplicationController
  before_action :set_todo, only: %i[show edit update destroy]

  def index
    @todos = Todo.all
  end

  def new; end

  def create
    todo = Todo.create(todo_params)
    redirect_to todos_path
  end

  def show; end

  def edit;  end


    def update
      todo = Todo.find(params[:todo_id])
      todo.completed == !todo.completed
      todo.save
      redirect_to todos_path #(EL METODO UPDATE PARA EL COMPLETADO DE LA PRUEBA)
    end



  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  def complete
     @todo = Todo.find(params[:id])
     @todo.completed = true
     @todo.save
     redirect_to todos_path
   end

  def list
    @completado = Todo.where(completed: true)
    @no_completado = Todo.where(completed: false)
  end

  private
  def todo_params
    params.require(:todo).permit(:completed)
  end

  def set_todo
    @todo = Todo.find(params[:id])

  end

end
