class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :title, null: false
      t.boolean :done, default: false, null: false
      t.integer :row_order
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
