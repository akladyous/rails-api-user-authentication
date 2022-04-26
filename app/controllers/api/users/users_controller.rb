class Api::Users::UsersController < ApplicationController
    skip_before_action :user_signed_in?, only: [:create]
    
    def show
        if current_user
            render json: current_user, status: :ok
        else
            render json: {error: "Unauthorized User"}, status: :unauthorized
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            render json: @user, status: :created
        else
            render json: {error: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end