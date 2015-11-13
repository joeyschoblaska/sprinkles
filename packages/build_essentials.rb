package :build_essentials do
  description "Build essentials"
  runner "sudo apt-get update"
  apt %w(curl build-essential), sudo: true
end
