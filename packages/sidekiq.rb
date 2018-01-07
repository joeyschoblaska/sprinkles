package :sidekiq do
  description "Sidekiq SystemD unit file"
  requires :redis
  template_search_path "templates/sidekiq"
  @app_name = opts[:app_name]

  file "/lib/systemd/system/sidekiq.service", content: render("sidekiq.service"), sudo: true

  runner "sudo systemctl enable sidekiq"
end
