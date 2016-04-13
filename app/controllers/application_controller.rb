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

  def format_datetime_to_iso_sub(params)
    params.each do |param|
      if param[1].class == ActionController::Parameters
        param[1] = format_datetime_to_iso_sub(param[1])
      elsif (/_date/.match(param[0]) || /_on/.match(param[0])) && param[1].present? && !/_blank/.match(param[0]) && !/_present/.match(param[0])
        unless param[1].split("-")[0].size == 4 && param[1].split("-")[1].size == 2 && param[1].split("-")[2].size == 2
          params[param[0]] = Date.strptime(param[1], I18n.t("date.formats.default")).to_s
        end
      end
    end
    return params
  end

  def format_datetime_to_iso
    if params
      params.each do |param|
        if param[1].class == ActionController::Parameters
          param[1] = format_datetime_to_iso_sub(param[1])
        else
          if (/_date/.match(param[0]) || /_on/.match(param[0])) && param[1].present?
            unless param[1].split("-")[0].size == 4 && param[1].split("-")[1].size == 2 && param[1].split("-")[2].size == 2
              params[param[0]] = Date.strptime(param[1], I18n.t("date.formats.default")).to_s
            end
          end
        end
      end
    end
    return params
  end


  protected

  def json_request?
    request.format.json?
  end

  def admin?
    user_signed_in? && current_user.role == "administrator"
  end
end
