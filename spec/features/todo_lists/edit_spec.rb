require 'spec_helper'

describe "Editing todo lists" do

    # let! es una función de Rspec que permite ejecutar un código antes de iniciar cada it y asignarlo a una variable
        # Esto es equivalente a crear el objeto todo_list siempre en la primera línea de cada it block
        # El método create fue declarado por el scaffold en todo_list_controller.rb
    let!(:todo_list) {TodoList.create(title: "Groceries", description: "Grocery list.")}


    def update_todo_list(options={})

        options[:title] ||= "My default title"
        options[:description] ||= "My default descrition"
        todo_list = options[:todo_list]

        visit "/todo_lists"

        # whithin nos ayuda a limitar la acción del comando de capybara a un css selector
            #todo_list.id imprime el id de este todo list (Rails viene conesta funcionalidad)?
        within "#todo_list_#{todo_list.id}" do
            click_link "Edit"
        end

        fill_in "Title", with: options[:title]
        fill_in "Description", with: options[:description]

        click_button "Update Todo list"

    end

    it "updates a todo list successfully with correct information" do

        update_todo_list({title: "New Title", description: "New description", todo_list: todo_list})

        # Cuando se hace click en "Update Todo list" se modifica la base de
        # datos, peor NO se actualiza la instancia todo_list en memoria.
        # Para esto se hace reload.  Así se vuelve a cargar la instancia desde la DB.
        todo_list.reload

        expect(page).to have_content("Todo list was successfully updated")
        expect(todo_list.title).to eq("New Title")
        expect(todo_list.description).to eq("New description")
    end


    it "displays an error with no title" do
    update_todo_list ({todo_list: todo_list, title: ""})
    title = todo_list.title
    todo_list.reload

    # Se verifica que el title que se envió sea igual al que quedó registrado en la base de datos
    expect(todo_list.title).to eq(title)
    expect(page).to have_content("error")
    end

    it "displays an error with too short a title" do
        update_todo_list ({todo_list: todo_list, title: "hi"})
        expect(page).to have_content("error")
    end

    it "displays an error with no description" do
        update_todo_list ({todo_list: todo_list, description: ""})
        expect(page).to have_content("error")
    end

    it "displays an error with too short a description" do
        update_todo_list ({todo_list: todo_list, description: "hi"})
        expect(page).to have_content("error")
    end

end
