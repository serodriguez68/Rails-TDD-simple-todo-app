require 'spec_helper'

describe "Editing todo lists" do

    # let! es una función de Rspec que permite ejecutar un código antes de iniciar cada it y asignarlo a una variable
        # Esto es equivalente a crear el objeto todo_list siempre en la primera línea de cada it block
        # El método create fue declarado por el scaffold en todo_list_controller.rb
    let!(:todo_list) {TodoList.create(title: "Groceries", description: "Grocery list.")}

    it "is succesful when clicking the destroy link" do

        visit "/todo_lists"

        # whithin nos ayuda a limitar la acción del comando de capybara a un css selector
            #todo_list.id imprime el id de este todo list (Rails viene conesta funcionalidad)?
        within "#todo_list_#{todo_list.id}" do
            click_link "Destroy"
        end

        expect(page).to_not have_content(todo_list.title)

        # Cuenta que no haya ningún elemento en la base de datos
        expect(TodoList.count).to eq(0)

    end

end
