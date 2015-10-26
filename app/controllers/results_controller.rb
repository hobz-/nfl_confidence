class ResultsController < ApplicationController
  
  def index
    @weeks = Week.all
  end
  
  def show
    @users = User.all
    @week = Week.find_by_id(params[:id])
  end
  
end
