class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_user_time_zone
  skip_before_action :verify_authenticity_token, if: :json_request?

  def set_user_time_zone
    Time.zone = user_signed_in? ? current_user.time_zone : "Central Time (US & Canada)"
  end
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end

  def set_operator
    RecordWithOperator.operator = current_user
  end

  protected

  def json_request?
    request.format.json?
  end

  def admin?
    user_signed_in? && current_user.role == "administrator"
  end
end
