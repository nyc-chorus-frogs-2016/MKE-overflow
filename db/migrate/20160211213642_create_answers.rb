class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text   :content, null: false
      t.string :best_answer
      t.integer :user_id, null: false
      t.integer :question_id, null: false

      t.timestamps null: false
    end
  end
end
