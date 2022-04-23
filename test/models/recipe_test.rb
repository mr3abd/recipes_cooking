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
require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
