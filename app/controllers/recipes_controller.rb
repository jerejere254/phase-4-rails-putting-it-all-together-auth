class RecipesController < ApplicationController
    before_action :authorize
    rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity

    def index
        render json: Recipe.all, include: :user, status:201
    end

    def create
        recipe = Recipe.create(user_id: session[:user_id])
        recipe.update!(recipe_params)
        render json: recipe,include: :user, status: 201
    end

    private

    def authorize
        return render json: {errors: ["Not Aothorized"]}, status: 401 unless session.include? :user_id
    end

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

    def render_unproccessable_entity(invalid)
       render  json: {errors: invalid.record.errors.full_messages}, status: 422
    end
end