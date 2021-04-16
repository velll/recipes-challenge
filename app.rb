$LOAD_PATH.unshift('lib') unless $LOAD_PATH.include?('server')
$LOAD_PATH.unshift(__dir__) unless $LOAD_PATH.include?(__dir__)

require 'pry' if ['development', 'test'].include?(ENV['RACK_ENV'])
require 'sinatra/base'
require 'dotenv/load'
require 'logger'

class ApplicationController < Sinatra::Base
  set :strict_paths, false
  set :show_exceptions, false
  set :logging, true

  error do
    logger.error('500: %s' % env['sinatra.error'])

    send_file 'public/500.html', status: 500
  end

  not_found do
    send_file 'public/404.html', status: 404
  end
end

require 'controllers/application_controller'
