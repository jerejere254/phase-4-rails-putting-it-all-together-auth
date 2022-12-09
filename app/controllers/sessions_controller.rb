class SessionsController < ApplicationController

    def create
        tourist = Tourist.find_by(username: params[:username])
        if tourist&.authenticate(params[:password])
            session[:tourist_id] = tourist.id
            render json: tourist
        else
            render json: {errors: ["Invalid Username or Password"]}, status: 401
        end
    end

    def destroy
        if session[:tourist_id]
            session.delete :tourist_id
            head 204
        else
            render json: {errors: ["Not Authorized"]}, status: 401
        end
    end

end