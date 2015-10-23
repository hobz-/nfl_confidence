week = ARGV

Pick.where(week_id: week).find_each do |pick|
    winner = pick.game.winner #pick.game.winner returns home_team/away_team. pick[winner] will return the wager (either 0 if wrong or >0pts if right)
    if winner != "TBD"
        if pick.result == nil
            pick.user.score += pick[winner]
            pick.user.save
            pick.result = pick[winner] 
            pick.save
        end
    end
end