package :puma do
  description "Puma SystemD unit file"
  template_search_path "templates/puma"
  @app_name = opts[:app_name]

  file "/lib/systemd/system/puma.service", content: render("puma.service"), sudo: true

  runner "sudo systemctl enable puma"
end
