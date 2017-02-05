package :ruby_dependencies do
  description "Ruby dependencies"
  apt %w(zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev libgmp3-dev), sudo: true
end

package :ruby do
  description "Ruby"
  requires :ruby_dependencies
  user = opts[:user] || "deploy"

  runner "/home/#{user}/.rvm/bin/rvm install #{opts[:ruby_version]}"
  runner "/home/#{user}/.rvm/bin/rvm alias create default #{opts[:ruby_version]}" # https://rvm.io/deployment/init-d
  runner "/home/#{user}/.rvm/bin/rvm all do gem install bundler"
end
