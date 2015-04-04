class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :json_request?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  protected

  def json_request?
    request.format.json?
  end

  def admin?
    user_signed_in? && current_user.role == "administrator"
  end

  def authorized?
    redirect_to new_user_session_url unless self.action_name == 'dashboard' || admin?
  end
end
