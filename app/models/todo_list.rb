class TodoList < ActiveRecord::Base

    # configura el title como un campo requerido y con una longitud mínima de 3 char
    validates :title, presence: true
    validates :title, length: { minimum: 3 }

end
