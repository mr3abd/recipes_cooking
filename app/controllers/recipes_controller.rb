class RecipesController < ApplicationController
  def index
    @pagy, @recipes = pagy(Recipe.all)
  end

  def show; end
end
