class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  after_action :set_csrf_cookie_for_ng
  before_action :configure_permitted_parameters, :if => :devise_controller?
  before_action :set_user_time_zone

  rescue_from Pundit::NotAuthorizedError do |exception|
    render nothing: true, status: 403
  end

  def angular
    render 'layouts/application'
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :time_zone
  end

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end

  def set_user_time_zone
    Time.zone = current_user.time_zone if current_user
  end

  def user_log
    current_user.log
  end

end
