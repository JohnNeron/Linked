class ApplicationController < ActionController::Base
    before_action :set_notifications, if: :current_luser
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname, :age, :role, :avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname, :age, :role, :avatar])
    end

    def after_sign_in_path_for(resource)
        lposts_path
     end

    def authorize_request(kind = nil)
        unless kind.include?(current_luser.role)
            redirect_to lposts_path, notice: "No Podés hacer esto"
        end
    end

    private

    def set_notifications
       notifications = Notification.where(recipient: current_luser).newest_first.limit(5)
       @unread = notifications.unread
       @read = notifications.read
    end
end