# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_424_152_730) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'authors', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'ingredients', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'ingredients_recipes', id: false, force: :cascade do |t|
    t.bigint 'recipe_id'
    t.bigint 'ingredient_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ingredient_id'], name: 'index_ingredients_recipes_on_ingredient_id'
    t.index ['recipe_id'], name: 'index_ingredients_recipes_on_recipe_id'
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'title'
    t.decimal 'cook_time'
    t.decimal 'prep_time'
    t.decimal 'ratings'
    t.string 'cuisine'
    t.bigint 'category_id', null: false
    t.bigint 'author_id', null: false
    t.string 'image'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.decimal 'total_time'
    t.index ['author_id'], name: 'index_recipes_on_author_id'
    t.index ['category_id'], name: 'index_recipes_on_category_id'
  end

  add_foreign_key 'recipes', 'authors'
  add_foreign_key 'recipes', 'categories'
end
