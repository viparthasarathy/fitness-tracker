class ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_and_authorize_chapter!, only: [:show, :update]

  def index
    render json: user_log.chapters, status: 200
  end

  def create
    @chapter = user_log.chapters.build(chapter_params)
    authorize @chapter
    @chapter.save ? (render json: @chapter, status: 201) : (render json: @chapter.errors, status: 400)
  end

  def show
    render json: @chapter, status: 200
  end

  def update
    @chapter.update(completed_at: Date.current)
    render json: @chapter, status: 200
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :description, :goal)
  end

  def set_and_authorize_chapter!
    @chapter = Chapter.find(params[:id])
    authorize @chapter
  end

end
