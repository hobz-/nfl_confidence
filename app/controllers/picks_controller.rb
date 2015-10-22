class PicksController < ApplicationController
  
  def create
    
    if validate_weekly_picks
      @user = User.first #place holder until current_user is implemented
      picks_params[:picks].each do |key, pick|
        game = Game.find(pick[:game_id])
        @existing_pick = @user.picks.find(pick[:game_id])
        if @existing_pick.updated_and_changed?(pick)
            flash[:success] ||= []
            flash[:success] << "Updated " + game.home_team + 
                               " vs " + game.away_team
        else
          @existing_pick.errors[:base].each do |error|
            flash[:error] ||= []
            flash[:error] << error
          end
        end
      end
    end

  redirect_to :back
  end

  private
  
    def picks_params
      params.permit(:picks => [:game_id, :week_id, :home_team, :away_team])
    end

    def validate_weekly_picks
      weekly_picks = []
      params[:picks].each do |key, pick|
        if !pick[:home_team].blank? && !pick[:home_team].to_i.zero?
          if weekly_picks.index(pick[:home_team]).nil?
            weekly_picks << pick[:home_team]
          elsif !weekly_picks.index(pick[:home_team]).nil?
            flash[:error] ||= []
            flash[:error] << "Too many games assigned " + pick[:home_team]
            return false
          end
        elsif !pick[:away_team].blank? && !pick[:away_team].to_i.zero?
          if weekly_picks.index(pick[:away_team]).nil?
            weekly_picks << pick[:away_team]
          elsif !weekly_picks.index(pick[:away_team]).nil?
            flash[:error] ||= []
            flash[:error] << "Too many games assigned " + pick[:away_team]
            return false
          end
        end
      end
    return true
    end
      
end
