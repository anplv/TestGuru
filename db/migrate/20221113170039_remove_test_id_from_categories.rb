class RemoveTestIdFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_reference :categories, :test, index: true, foreign_key: true
  end
end
