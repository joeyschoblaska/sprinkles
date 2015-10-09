package :ruby_dependencies do
  description "Ruby dependencies"
  apt %w(zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev), sudo: true
end

package :ruby do
  description "Ruby"
  version "2.2"
  requires :ruby_dependencies

  runner "/home/deploy/.rvm/bin/rvm install #{version}"
  runner "/home/deploy/.rvm/bin/rvm alias create default #{version}"
end
