package :nginx do
  description "nginx and configuration files"
  template_search_path "templates/nginx"
  @app_name = opts[:app_name]
  @server_name = opts[:server_name]

  apt %w(nginx), sudo: true
  file "/etc/nginx/sites-available/#{@app_name}", content: render("nginx.conf"), sudo: true
  runner "ln -s /etc/nginx/sites-available/#{@app_name} /etc/nginx/sites-enabled/#{@app_name}", sudo: true

  verify do
    has_executable "nginx"
    has_file "/etc/nginx/sites-available/#{@app_name}"
  end
end

package :nginx_static do
  description "nginx and configuration files for serving static content only"
  template_search_path "templates/nginx"
  @app_name = opts[:app_name]
  @server_name = opts[:server_name]

  apt %w(nginx), sudo: true
  file "/etc/nginx/sites-available/#{@app_name}", content: render("nginx-static.conf"), sudo: true
  runner "ln -s /etc/nginx/sites-available/#{@app_name} /etc/nginx/sites-enabled/#{@app_name}", sudo: true

  verify do
    has_executable "nginx"
    has_file "/etc/nginx/sites-available/#{@app_name}"
  end
end
