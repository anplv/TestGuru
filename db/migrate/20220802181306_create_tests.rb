class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      add_foreign_key :categories, :tests

      t.timestamps
    end
  end
end
