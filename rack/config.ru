require 'rack'
require_relative '../lib/teien'

use Rack::Reloader, 0

run Application.new