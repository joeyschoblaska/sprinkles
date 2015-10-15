package :unicorn do
  description "Unicorn config files and init script"
  template_search_path "templates/unicorn"
  @app_name = opts[:app_name]

  # init.d file
  file "/etc/init.d/unicorn", content: render("init.d"), sudo: true
  runner "chmod +x /etc/init.d/unicorn", sudo: true
  runner "mkdir -p /home/deploy/#{@app_name}/shared/pids"
end
