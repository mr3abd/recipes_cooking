# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  cook_time   :decimal(, )
#  cuisine     :string
#  image       :string
#  prep_time   :decimal(, )
#  ratings     :decimal(, )
#  title       :string
#  total_time  :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint           not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_recipes_on_author_id    (author_id)
#  index_recipes_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (category_id => categories.id)
#
class Recipe < ApplicationRecord
  include Filterable
  belongs_to :category
  belongs_to :author
  has_and_belongs_to_many :ingredients

  scope :filter_by_title, ->(title) { where('title like ?', "%#{title}%") }
  scope :filter_by_category, ->(category) { where(category: Category.where('title like ?', "%#{category}%")) }
  scope :filter_by_author_id, ->(author_id) { where(author_id: author_id) }
  scope :filter_by_ratings, ->(ratings) { where(ratings: ratings..) }
  scope :filter_by_less_time, ->(less_time) { where(total_time: ..less_time) }

  before_save :update_total_time

  def self.seed_json_data(json_file)
    data = JSON.parse(json_file)
    data.each do |recipe_data|
      recipe = new(title: recipe_data['title'], image: recipe_data['image'],
                   prep_time: recipe_data['prep_time'], cook_time: recipe_data['cook_time'],
                   ratings: recipe_data['ratings'], cuisine: recipe_data['cuisine'])
      # Author
      author = Author.find_or_create_by(name: recipe_data['author'])
      recipe.author = author
      # Category
      category = Category.find_or_create_by(title: recipe_data['category'])
      recipe.category = category

      # Ingredinets
      recipe_data['ingredients'].each do |ingredient_json|
        ingredient = Ingredient.find_or_create_by(title: ingredient_json)
        recipe.ingredients << ingredient
      end
      recipe.save
      p "done add #{recipe.id}"
      p '#' * 5
    end
  end

  # for finding best Recipes for my current_ingredientss_ids
  def self.my_ingredintes(current_ingredientss_ids)
    joins(:ingredients).where(ingredients: { id: current_ingredientss_ids }).select do |recipe|
      recipe.match_ingredients(current_ingredientss_ids)
    end
  end

  def match_ingredients(array_ids)
    returned = []
    ingredients.ids.each do |ingredinet_id|
      returned << array_ids.include?(ingredinet_id)
    end
    returned.exclude?(false)
  end

  def update_total_time
    self.total_time = prep_time.to_f + cook_time.to_f
  end
end
