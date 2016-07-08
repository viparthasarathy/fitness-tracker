class LogsController < ApplicationController
  before_action :authenticate_user!

  def show
    @log = current_user.log
    render json: @log
  end

end
