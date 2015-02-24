class TodoItem < ActiveRecord::Base
  # Esta relación la crea automáticamente rails cuando creó el modelo de todo_item
  # en la consola diciendo que todo_list:references
  belongs_to :todo_list
end
