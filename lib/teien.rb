# frozen_string_literal: true
require 'rack'


require_relative 'teien/parser'
require_relative 'teien/app'
require_relative 'teien/generator'
require_relative 'teien/interpreter'

class Application
  def call(env)
    status  = 200
    headers = { "Content-Type" => "text/html" }
    body    = ["Hello from Rack"]

    [status, headers, body]
  end
end