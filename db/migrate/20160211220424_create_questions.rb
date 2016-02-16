class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string   :title, null: false
      t.string   :content, null: false
      t.integer  :user_id, null: false
      t.string   :status, default: "open"

      t.timestamps null: false
    end
  end
end
