class StaticPagesController < ApplicationController
  
  def index
    @users = User.order("score DESC, weekly_wins DESC")
  end

end
