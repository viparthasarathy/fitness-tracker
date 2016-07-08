class LogsController < ApplicationController

  def show
    @log = current_user.log
    render json: @log
  end

end
