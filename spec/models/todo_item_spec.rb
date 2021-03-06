require 'spec_helper'

describe TodoItem do
    # Esta es una línea de código de shoulda matchers que prueba que el todo item pertenezca a u todo list
    it { should belong_to(:todo_list) }

    describe "#completed?" do
        let(:todo_item) {TodoItem.create(content: "Hello")}

        it "is false qhen completed_at is blank" do
            todo_item.completed_at = nil
            expect(todo_item.completed?).to be_false

        end

        it "returns true when completed at is not empty" do
            todo_item.completed at = Time.now
            expect(todo_item.completed?).to be_true
        end
    end
end
