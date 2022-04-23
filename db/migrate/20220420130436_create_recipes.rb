class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.decimal :cook_time
      t.decimal :prep_time
      t.decimal :ratings
      t.string :cuisine
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
