$LOAD_PATH.unshift('lib') unless $LOAD_PATH.include?('lib')
$LOAD_PATH.unshift(__dir__) unless $LOAD_PATH.include?(__dir__)

require 'pry' if ['development', 'test'].include?(ENV['RACK_ENV'])
require 'sinatra/base'
require 'dotenv/load'
require 'logger'
require 'repos/all'
require 'models/recipe'
require 'lib/contentful_client'

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

contentful_client = BuildContentfulClient.call(ENV['CONTENTFUL_SPACE_ID'], ENV['CONTENTFUL_ACCESSS_TOKEN'])
ContentfulRepo.connect(contentful_client)

require 'controllers/application_controller'
