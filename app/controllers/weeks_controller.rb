class WeeksController < ApplicationController
  def index
    @weeks = Week.all
  end

  def show #We show the week, and allow the user to modify their picks in the same view
    @week = Week.find_by_id(params[:id])
    @user = User.first #place holder until current_user is implemented
    @games = @week.games
    @picks = []
    @games.each do |game|
      if game.picks.find_by(user_id: @user.id)
        pick = @user.picks.find_by(game_id:game.id)
      else
        pick = @user.picks.new(game_id:game.id, week_id:@week.id, home_team:0, away_team:0)
        pick.save
      end
    @picks << pick 
    end
  end
end


