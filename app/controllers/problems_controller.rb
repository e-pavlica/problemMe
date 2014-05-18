class ProblemsController < ApplicationController
  respond_to :html, :json
  def index
    @problems = Problem.all
    respond_with @problems
  end

  def new
    @sequence = Problem.new
    respond_with @problem
  end

  def show
    @problem = Problem.find(params[:id])
    respond_with @problem
  end

end
