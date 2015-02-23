require 'spec_helper'
# la sintáxis del test está dada por Capybara


# describe describe qué es lo que estamos probando
describe "Creating todo lists" do
    # it - que hace el test cuando tiene success
    it "redirects to the todo list index page on success" do

        # Acá se escriben los comandos de prueba
            # es un paso a paso de lo que debe hacer la prueba
        visit "/todo_lists"
        click_link "New Todo list"
        expect(page).to have_content("New todo_list")

        fill_in "Title", with: "My todo list"
        fill_in "Description", with: "This is what I'm doing today."
        click_button "Create Todo list"

        expect(page).to have_content("My todo list")

    end

    it "displays an error when the todo list has no tilte" do
        expect(TodoList.count).to eq(0)

        visit "/todo_lists"
        click_link "New Todo list"
        expect(page).to have_content("New todo_list")

        fill_in "Title", with: ""
        fill_in "Description", with: "This is what I'm doing today."
        click_button "Create Todo list"


        expect(page).to have_content("error")
        expect(TodoList.count).to eq(0)

        visit "/todo_lists"
        expect(page).to_not have_content("This is what I'm doing today.")
    end


    it "displays an error when the todo list has a title less than 3 char" do
        expect(TodoList.count).to eq(0)

        visit "/todo_lists"
        click_link "New Todo list"
        expect(page).to have_content("New todo_list")

        fill_in "Title", with: "Hi"
        fill_in "Description", with: "This is what I'm doing today."
        click_button "Create Todo list"


        expect(page).to have_content("error")
        expect(TodoList.count).to eq(0)

        visit "/todo_lists"
        expect(page).to_not have_content("This is what I'm doing today.")
    end
end
