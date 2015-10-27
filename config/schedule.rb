# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
set :output, '/home/ubuntu/workspace/nfl_confidence/log/cron.log'

job_type :update_picks, 'cd /home/ubuntu/workspace/nfl_confidence && /usr/local/rvm/gems/ruby-2.1.5@global/bin/bundle exec rails runner lib/check_weekly_pick_results.rb :task :output'

every '* * * * *' do
  
  update_picks "2015 7"
end