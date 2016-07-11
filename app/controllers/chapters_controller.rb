class ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_creation!, only: [:create]

  def create
    @chapter = user_log.chapters.build(chapter_params)
    @chapter.save ? (render json: @chapter, status: 201) : (render json: @chapter.errors, status: 400)
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :description, :goal)
  end

  def authorize_creation!
    render nothing: true, status: 403 if user_log.has_chapter_in_progression
  end

end
