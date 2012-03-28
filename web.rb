require 'sinatra'
require 'heroku-api'

configure do
  ApiKey = ENV['HEROKU_API_KEY'] || fail("Must set HEROKU_API_KEY")
  AppName = ENV['HEROKU_APP_NAME'] || fail("Must set HEROKU_APP_NAME")
end

get '/' do
  'ok'
end

get '/restart' do
  heroku = Heroku::API.new(:api_key => ApiKey)
  heroku.post_ps_restart(AppName)
  'restarting'
end
