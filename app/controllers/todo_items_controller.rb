class TodoItemsController < ApplicationController
  def index
    # permite encontrar el todo list al que el item pertenece a través del route
        # @todo_lilst estará disponible en el view
    @todo_list = TodoList.find(params[:todo_list_id])
  end
end
