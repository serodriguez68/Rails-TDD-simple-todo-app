require 'spec_helper'
# la sintáxis del test está dada por Capybara


# describe describe qué es lo que estamos probando
describe "Creating todo lists" do

    def create_todo_list(options={})
        options[:title] ||= "My default title"
        options[:description] ||= "My default descrition"

        visit "/todo_lists"
        click_link "New Todo list"
        expect(page).to have_content("New todo_list")

        fill_in "Title", with: options[:title]
        fill_in "Description", with: options[:description]
        click_button "Create Todo list"
    end

    # it - que hace el test cuando tiene success
    it "redirects to the todo list index page on success" do

        # Acá se escriben los comandos de prueba
            # es un paso a paso de lo que debe hacer la prueba

        create_todo_list({title: "My todo list", description: "This is what I'm doing today"})

        expect(page).to have_content("My todo list")

    end

    it "displays an error when the todo list has no tilte" do
        expect(TodoList.count).to eq(0)

        create_todo_list({title: "", description: "This is what I'm doing today"})

        expect(page).to have_content("error")
        expect(TodoList.count).to eq(0)

        visit "/todo_lists"
        expect(page).to_not have_content("This is what I'm doing today.")
    end


    it "displays an error when the todo list has a title less than 3 char" do
        expect(TodoList.count).to eq(0)

        create_todo_list({title: "Hi", description: "This is what I'm doing today"})

        expect(page).to have_content("error")
        expect(TodoList.count).to eq(0)

        visit "/todo_lists"
        expect(page).to_not have_content("This is what I'm doing today.")
    end

     it "displays an error when the todo list has no description" do
        expect(TodoList.count).to eq(0)

        create_todo_list({title: "Something", description: ""})

        expect(page).to have_content("error")
        expect(TodoList.count).to eq(0)

        visit "/todo_lists"
        expect(page).to_not have_content("Something")
    end

    it "displays an error when the todo list has a description less than 5 char" do
        expect(TodoList.count).to eq(0)

        create_todo_list({title: "Something", description: "foo"})

        expect(page).to have_content("error")
        expect(TodoList.count).to eq(0)

        visit "/todo_lists"
        expect(page).to_not have_content("Something")
    end


end
