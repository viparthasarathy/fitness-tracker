class EntriesController < ApplicationController
  before_action :authenticate_user!

  def create
    @entry = Entry.new(entry_params)
    authorize @entry
    @entry.save ? (render json: @entry, status: 201) : (render json: @entry.errors, status: 400)
  end

  def show
    @entry = Entry.find(params[:id])
    authorize @entry
    render json: @entry, status: 200
  end

  private

  def entry_params
    params.require(:entry).permit(:chapter_id, :notes, :day)
  end
end
