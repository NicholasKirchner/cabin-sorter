require 'csv'

class AssignmentsController < ApplicationController

  def new
  end

  def create
    email = params[:user][:email]
    table = CSV.read(params[:preferences].path, headers: true)
    SorterWorker.perform_async(table, email)
  end
  
end
