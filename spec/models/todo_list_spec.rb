require 'spec_helper'

describe TodoList do
    # Codigo de shoulda matchers para probar que una lista tiene muchos items
      it { should have_many(:todo_items) }
end
