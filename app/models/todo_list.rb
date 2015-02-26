class TodoList < ActiveRecord::Base

    # Acá le decimos al app que una lista tiene muchos items
    has_many :todo_items

    # configura el title como un campo requerido y con una longitud mínima de 3 char
    validates :title, presence: true
    validates :title, length: { minimum: 3 }

    # configura description como un campo requerido y con una longitud mínima de 3 char
    validates :description, presence: true
    validates :description, length: { minimum: 5 }


    def has_completed_items?
        # llama al scope de todo item
        todo_items.complete.size > 0
    end

    def has_incomplete_items?
        # llama al scope de todo item
        todo_items.incomplete.size > 0
    end
end
