class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else
            render json: {errors: ["Invalid Username or Password"]}, status: 401
        end
    end

    def destroy
        if session[:user_id]
            session.delete :user_id
            head 204
        else
            render json: {errors: ["Not Authorized"]}, status: 401
        end
    end

end