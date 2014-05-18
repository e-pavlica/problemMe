class ContentsController < ApplicationController
  before_action :set_problem
  respond_to :html, :json

  def new
    if params[:type] == 'video'
      @video = Video.new
    elsif params[:type] == 'image'
      @image = Image.new
    elsif params[:type] == 'audio'
      @audio = Audio.new
    elsif params[:type] == 'quote'
      @quote = Quote.new
    else
      redirect_to problem_path(@problem), error: 'invalid content type'
    end
  end

  def create
    if params[:video]
      @content = Video.new(video_params)
    elsif params[:image]
      @content = Image.new(image_params)
    elsif params[:audio]
      @content = Audio.new(audio_params)
    elsif params[:quote]
      @content = Quote.new(quote_params)
    end
    if @content.save && @problem.contents << @content
      respond_with(@video) do |f|
        f.json { render :json }
        f.html redirect_to problem_path(@problem)
      end
    end
  end

  private

  def set_problem
    @problem = Problem.find(params[:problem_id])
  end

  def video_params
    params.require(:video).permit(:url, :title)
  end

  def quote_params
    params.require(:quote).permit(:title, :text, :author)
  end

  def audio_params
    params.require(:audio).permit(:title, :url)
  end

  def image_params
    params.require(:image).permit(:title, :url)
  end
end
