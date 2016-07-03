class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  config.to_prepare do
    DeviseController.respond_to :html, :json
  end

  def angular
    render 'layouts/application'
  end

end
