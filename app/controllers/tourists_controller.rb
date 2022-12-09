class TouristsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessible_entity
        def create
            tourist = Tourist.create!(user_params)
            session[:tourist_id] = tourist.id
            render json: user, status: 201
        end
    
        def show
            tourist = Tourist.find_by(id: session[:tourist_id])
            if tourist
                render json: tourist
            else
                render json: {error: "unauthorized"}, status: 401
            end
        end
    
        private
    
        def tourist_params
            params.permit(:username, :password, :password_confirmation, :user_type)
        end
    
        def render_unprocessible_entity(invalid)
            render json: {errors: invalid.record.errors.full_messages}, status: 422
        end
    end