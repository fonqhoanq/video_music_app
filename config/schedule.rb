# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

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

every 1.day, at: '10:50 am' do
  runner "TrendingScore.new.execute"
end
every 1.day, at: '2:21 pm' do
  runner "PlaylistByTopicBatch.new.execute_singer_topic"
end

every 1.day, at: '3:08 pm' do
  runner "PlaylistByTopicBatch.new.execute_trending_topic"
end

every 1.day, at: '3:17 pm' do
  runner "OwnPlaylistBatch.new.execute"
end
# Learn more: http://github.com/javan/whenever
