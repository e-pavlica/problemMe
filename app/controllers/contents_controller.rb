class ContentsController < ApplicationController
  before_action :set_problem
  respond_to :html, :json

  def new

  end

  def create
    @content = Content.new(video_params)
    if @content.save
      respond_with @content
    else
      respond_with status: 400
    end
  end
  private

  def set_problem
    @problem = Problem.find(params[:problem_id])
  end

  def video_params
    params.require(:video).permit(:url, :title)
  end

end
