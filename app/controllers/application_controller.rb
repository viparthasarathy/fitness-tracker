class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  after_filter :set_csrf_cookie_for_ng

rescue_from Pundit::NotAuthorizedError do |exception|
  render nothing: true, status: 403
end

  def angular
    render 'layouts/application'
  end

  private

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end

  def user_log
    current_user.log
  end

end
