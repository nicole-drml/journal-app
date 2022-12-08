class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :notes, null: false
      t.datetime :due, null: false
      t.integer :category_id

      t.timestamps
    end
  end
end
