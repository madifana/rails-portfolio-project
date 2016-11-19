class IngredientsController < ApplicationController
  before_filter :auth_user
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to ingredients_path
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @ingredient}
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:id, :ingredient_name)
  end

end
