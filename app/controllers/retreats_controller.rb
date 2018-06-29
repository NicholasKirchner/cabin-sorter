class RetreatsController < ApplicationController

  before_action :authenticate_user!
  
  def new
    @retreat = Retreat.new
  end

  def create
  end

end
