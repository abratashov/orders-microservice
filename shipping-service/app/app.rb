# server.rb
require 'sinatra'
require 'mongoid'

require_relative '../model/shipping'
Mongoid.load! 'mongoid.config'

set :port, 4568

get '/list' do
  Shipping.all.to_json
end
