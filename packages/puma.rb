package :puma do
  description "Puma config files and init script"
  template_search_path "templates/puma"
  @app_name = opts[:app_name]

  file "/etc/init/puma.conf",         content: render("puma.conf"), sudo: true
  file "/etc/init/puma-manager.conf", content: render("puma-manager.conf"), sudo: true
  file "/etc/pumas.conf",             content: render("pumas.conf"), sudo: true
end
