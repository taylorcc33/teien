require 'rack'

use Rack::Reloader, 0

run Rack::Directory.new('dist')