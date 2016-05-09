class Api::V1::MealsController < ApplicationController
  before_action :authenticate_user!

  # Get current_user (me) meals
  def index
    @today_meal   = @current_user.meals.for_today
    @current_meal = @current_user.prepare_for_meal if @current_meal.nil?
    @until_today_meals = @current_user.meals.until_today.limit(5)
  end

  # Create meal for the current user (me)
  def create
    @meal = @current_user.eat(meals_params)

    if @meal.valid?
      @meal
      render json: { meal: @meal }
    else
      render jsn: { errors: @meal.errors }, status: :unprocessable_entity
    end
  end

  private

    def meals_params
      params.require(:meal).permit(:cereal, :fruit, :vegetable,
                                  :meat, :dairy, :sweets, :fats)
    end

end
