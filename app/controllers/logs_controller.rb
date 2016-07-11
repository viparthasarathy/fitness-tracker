class LogsController < ApplicationController
  before_action :authenticate_user!

  def show
    @log = user_log
    render json: @log
  end

end
