class ChaptersController < ApplicationController
  before_action :authenticate_user!


  def create
    @chapter = user_log.chapters.build(chapter_params)
    authorize @chapter
    @chapter.save ? (render json: @chapter, status: 201) : (render json: @chapter.errors, status: 400)
  end

  def show
    @chapter = Chapter.find(params[:id])
    authorize @chapter
    render json: @chapter
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :description, :goal)
  end

end
