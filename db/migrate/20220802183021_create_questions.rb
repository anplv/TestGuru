class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :body, null: false
      add_foreign_key :tests, :questions

      t.timestamps
    end
  end
end
