package :rvm_dependencies do
  apt %w(libgdbm-dev libncurses5-dev automake libtool bison libffi-dev), sudo: true
end

package :rvm do
  description "RVM"
  requires :rvm_dependencies

  runner "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
  runner "curl -L https://get.rvm.io | bash -s stable"

  verify do
    has_executable "/home/deploy/.rvm/bin/rvm"
  end
end
