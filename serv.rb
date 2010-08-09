require 'rubygems'
require 'sinatra'

get "/" do
   params[:oauth_token]
end
