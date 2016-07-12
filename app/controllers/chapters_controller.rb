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

  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.completed_at
      render nothing: true, status: 403
    else
      @chapter.update(completed_at: Date.today)
      render json: @chapter, status: 200
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :description, :goal)
  end

end
