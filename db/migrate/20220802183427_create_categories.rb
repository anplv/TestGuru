class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      add_foreign_key :tests, :categories

      t.timestamps
    end
  end
end
