class AssignmentsController < ApplicationController

  def new
  end

  def create
    CSV.read(params[:preferences].path, headers: true)
  end
  
end
