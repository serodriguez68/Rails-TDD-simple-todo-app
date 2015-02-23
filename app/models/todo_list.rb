class TodoList < ActiveRecord::Base

    # configura el title como un campo requerido y con una longitud mínima de 3 char
    validates :title, presence: true
    validates :title, length: { minimum: 3 }

    # configura description como un campo requerido y con una longitud mínima de 3 char
    validates :description, presence: true
    validates :description, length: { minimum: 5 }

end
