# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes
end
