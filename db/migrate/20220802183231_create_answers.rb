class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.boolean :correct, default: false
      t.string :body, null: false
      add_foreign_key :questions, :answers

      t.timestamps
    end
  end
end
