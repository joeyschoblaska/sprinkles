package :dotfiles do
  description "joeyschoblaska/dotfiles.git"
  requires :ruby

  runner "if [ ! -d 'dotfiles' ]; then git clone git@github.com:joeyschoblaska/dotfiles.git; fi"
  runner "cd dotfiles && git pull origin master && /bin/bash -l -c 'ruby install.rb'"
end
