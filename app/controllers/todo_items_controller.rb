class TodoItemsController < ApplicationController
#Todas las variables de instancia del controlador están disponibles en el view respectivo

  def index
    # permite encontrar el todo list al que el item pertenece a través del route
        # @todo_lilst estará disponible en el view
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def new
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.new
  end

  def create
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.new(todo_item_params) #relacionado con strong parameters
    if @todo_item.save
        flash[:success] = "Added todo list item."
        redirect_to todo_list_todo_items_path
    else
        flash[:error] = "There was a problem adding that todo list item"
        render action: :new
    end

  end

  # Le dice a Rails que está bien trabajar con el parámetro content
    # Strong parameters (documentation)
  private
  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
