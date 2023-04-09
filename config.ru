require 'rack'

use Rack::Reloader, 0
# user Rack::Static, :urls => ["/dist"], :root => "dist"

use Rack::Static,
  :urls => ["/images", "/js", "/css", "/html"],
  :root => "dist"

run lambda { |env|
  if env['PATH_INFO'] == '/'
    # Serve index.html if the "/" is requested
    file = File.open('dist/index.html', File::RDONLY)
    [200, {'Content-Type' => 'text/html'}, file]
  else
    # Serve other HTML files in the "dist" directory
    path = "dist#{env['PATH_INFO']}"
    if File.exist?(path)
      file = File.open(path, File::RDONLY)
      [200, {'Content-Type' => 'text/html'}, file]
    else
      # Serve 404.html if the requested file doesn't exist
      file = File.open('dist/404.html', File::RDONLY)
      [404, {'Content-Type' => 'text/html'}, file]
    end
  end
}
