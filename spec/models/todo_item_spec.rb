require 'spec_helper'

describe TodoItem do
    # Esta es una línea de código de shoulda matchers que prueba que el todo item pertenezca a u todo list
    it { should belong_to(:todo_list) }
end
