class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body
      add_foreign_key :questions, :answers

      t.timestamps
    end
  end
end
