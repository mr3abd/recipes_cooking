class RecipesController < ApplicationController
  def index
    @pagy, @recipes = pagy(Recipe.filter(filtering_params))

  end

  def show; end

  private
  def filtering_params
    params.slice(:title , :less_time ,:ratings , :category)
  end

end
