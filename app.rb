require 'sinatra'
require 'sinatra/activerecord'

set :public_folder, File.dirname(__FILE__) + '/public'
set :database, 'sqlite:///sample.db'

class Riddle < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :details
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/add' do
  send_file File.join(settings.public_folder, 'add.html')
end

# API

get '/riddles' do
  content_type 'application/json'
  Riddle.select([:name, :details, :id]).to_json
end

post '/riddle/create' do
  content_type 'application/json'

  @riddle = Riddle.new(params[:riddle]) 
  if @riddle.save 
    @riddle.attributes.to_json
  else
    { :errors => @riddle.errors.messages }.to_json 
  end
end

get '/riddle/:id' do
  content_type 'application/json'
  Riddle.find(params[:id]).attributes.to_json
end
