require 'rubygems'
require 'sinatra'

get "/" do
  "Input " + params[:oauth_token] + "to console"
end
