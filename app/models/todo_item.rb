class TodoItem < ActiveRecord::Base
  # Esta relación la crea automáticamente rails cuando creó el modelo de todo_item
  # en la consola diciendo que todo_list:references
  belongs_to :todo_list

  # configura el content como un campo requerido y con una longitud mínima de 2 char
    # muestra una sintáxis combinada
    validates :content, presence: true, length: { minimum: 2 }

end
