require 'rubygems'
require 'bundler'
Bundler.require

require 'sinatra'
require 'tempfile'
require 'base64'
require File.expand_path '../models/transcriber.rb', __FILE__
require File.expand_path '../models/file_builder.rb', __FILE__

get '/' do
  'Pocketsphinx API'
end

get '/transcribe' do
  {
    message: 'try POST silly',
  }.to_json
end

post'/transcribe' do
  headers 'Access-Control-Allow-Origin' => 'your-client-server'
  tmp_file = FileBuilder.new(params).build
  transcriber = Transcriber.new(File.open(tmp_file.path))
  transcriber.transcribe!
  tmp_file.unlink
  puts transcriber.transcription
  {
    hypothesis: transcriber.transcription
  }.to_json
end