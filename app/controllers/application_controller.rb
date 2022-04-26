class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :user_signed_in?

    rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique

    private
        def current_user
            @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end

        def user_signed_in?
            unless current_user
                render json: {error: "User not authorized"}, status: :unauthorized
            end
        end

        # ----
        def invalid_record(exception)
            render json: {error: exception.record.errors.full_messages}, status: :unprocessable_entity
        end
        def record_not_found(exception)
            # render json: {error: exception.errors.full_messages}, status: :not_found
            render json: {error: "Record not found"}, status: :not_found
        end
        def record_not_unique(exception)
            render json: {error: exception.message}, status: :unprocessable_entity
        end
        def invalid_association(exception)
            render json: {error: "Unprocessable request"}, status: :unprocessable_entity
        end
        def failed_to_save
            render json: {error: "Failed to save the record"}, status: :unprocessable_entity
        end
        def interal_error
            render json: {error: "Internal Error"}, status: :unprocessable_entity
        end
        def render_unprocessable
            render json: {error: "Unprocessable request"}, status: :unprocessable_entity
        end
        def render_not_found
            render json: {error: "Record not Found"}, status: :not_found
        end
        def render_ok obj
            render json: obj, status: :ok
        end
end
