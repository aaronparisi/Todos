class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.datetime :dueAt, null: false
      t.boolean :detailsShowing, default: true, null: false
      t.boolean :done, default: false, null: false
      t.datetime :completedAt
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
