class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      add_foreign_key :categories, :tests

      t.timestamps
    end
  end
end
