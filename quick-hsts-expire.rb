# frozen_string_literal: true

require 'sinatra'
require 'rack/ssl-enforcer'

class QuickHstsExpire < Sinatra::Base
  use Rack::SslEnforcer, hsts: { expires: 5 }, https_port: 4567

  get '/' do
    'HSTS Header set to expire in 5 seconds'
  end
end

unless ENV['CRT_FILE'] && ENV['KEY_FILE']
  puts "Set CRT_FILE and KEY_FILE to reference your existing crt/key pair."
end

QuickHstsExpire.run! do |server|
  server.ssl = true
  server.ssl_options = {
    cert_chain_file: ENV['CRT_FILE'],
    private_key_file: ENV['KEY_FILE'],
    verify_peer: false
  }
end
