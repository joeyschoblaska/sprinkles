package :capistrano do
  description "Create directories that Capistrano expects to be present"

  %w(pids sockets log).each do |dir|
    runner "mkdir -p /home/deploy/#{opts[:app_name]}/shared/#{dir}"
  end
end
