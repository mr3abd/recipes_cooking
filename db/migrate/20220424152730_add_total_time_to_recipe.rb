class AddTotalTimeToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :total_time, :decimal
  end
end
