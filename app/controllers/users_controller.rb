class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessible_entity
        def create
            user = User.create!(user_params)
            session[:user_id] = user.id
            render json: user, status: 201
        end
    
        def show
            user = User.find_by(id: session[:user_id])
            if user
                render json: user
            else
                render json: {error: "unauthorized"}, status: 401
            end
        end
    
        private
    
        def user_params
            params.permit(:username, :password, :password_confirmation, :image_url, :bio)
        end
    
        def render_unprocessible_entity(invalid)
            render json: {errors: invalid.record.errors.full_messages}, status: 422
        end
    end