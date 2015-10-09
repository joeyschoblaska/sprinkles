package :rvm_dependencies do
  apt %w(libgdbm-dev libncurses5-dev automake libtool bison libffi-dev)
end

package :rvm do
  description "RVM"
  requires :rvm_dependencies

  apt "ruby-full" do
    post :install, "-u deploy gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
    post :install, "curl -L https://get.rvm.io | bash -s stable"
  end
end
