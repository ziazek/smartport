# Use this file to easily define all of your cron jobs.

set :output, "#{path}/log/cron.log"

# ensure that the $PATH for cronjobs is the same as for our login shell
env :PATH, ENV['PATH']

# job_type :backup, "cd :path/:backup_path && :environment_variable=:environment bundle exec backup perform -t :task --config_file ./config.rb :output"

# every 60.minutes do
#   backup 'rails_database', backup_path: 'backup'
# end

# job_type :job, "cd :path && :environment_variable=:environment bundle exec script/sidekiq_pusher.rb :task :output"

# every 10.minutes do
#   job 'SyncBlogPostsWorker'
# end

# every 3.minutes do 
#   job 'SyncSalesforce'
# end
# #
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
