class ChaptersController < ApplicationController
  before_action :authenticate_user!

  def create
    @chapter = user_log.chapters.build(chapter_params)
    @chapter.save ? (render json: @chapter, status: 201 : status: 403)
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :description, :goal)
  end

  def authorize_creation
    user_log.latest_chapter.completed_at == nil
  end

end
