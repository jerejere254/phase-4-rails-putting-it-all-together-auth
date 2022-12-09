class SitessController < ApplicationController
    before_action :authorize
    rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessable_entity

    def index
        render json: Site.all, include: :tourist, status:201
    end

    def create
        recipe = Site.create(tourist_id: session[:tourist_id])
        site.update!(site_params)
        render json: site,include: :tourist, status: 201
    end

    private

    def authorize
        return render json: {errors: ["Not Aothorized"]}, status: 401 unless session.include? :tourist_id
    end

    def recipe_params
        params.permit(:title, :description, :price, :image_url, :remaining, :tourguide_id)
    end

    def render_unproccessable_entity(invalid)
       render  json: {errors: invalid.record.errors.full_messages}, status: 422
    end
end