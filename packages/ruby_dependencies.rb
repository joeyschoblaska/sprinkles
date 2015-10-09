package :ruby_dependencies do
  description "Ruby dependencies"
  apt %w(curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev)
end
