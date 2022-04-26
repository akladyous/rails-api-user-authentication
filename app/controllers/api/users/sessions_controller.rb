class Api::Users::SessionsController < ApplicationController
    skip_before_action :user_signed_in?, only: [:create, :destroy]

    def create
        @user = User.find_by(email: session_params[:email])
        if @user.present? && @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            render json: {message: "Login successfully completed"}, status: :ok
        else
            render json: {error: "Unauthorized user"}, status: :unauthorized
        end
    end

    def destroy
        if current_user
            session.delete :user_id
            render json: {message: "Logout successfully completed"}, status: :ok
        else
            render json: {message: "User not signed in"}, status: :unprocessable_entity
        end
    end

    private

    def session_params
        params.require(:user).permit(:email, :password)
    end
end
