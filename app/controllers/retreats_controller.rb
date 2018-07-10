class RetreatsController < ApplicationController

  before_action :authenticate_user!
  
  def new
    @retreat = Retreat.new
  end

  def create
    @retreat = Retreat.build(retreat_params)
    if @retreat.save
      flash[:success] = "Retreat saved"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    @retreat.destroy
    flash[:success] = "Retreat deleted."
    redirect_to root_url
  end

  private

  def retreat_params
    params.require(:retreat)
  end

end
