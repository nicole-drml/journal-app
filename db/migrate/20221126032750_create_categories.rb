class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :user_id
      t.references :category, foreign_key: true
      
      t.timestamps
    end
  end
end
