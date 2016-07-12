require 'sinatra'
require 'json'
require File.expand_path '../models/transcriber.rb', __FILE__

get '/' do
  'Pocketsphinx API'
end

get '/transcribe' do
  {
    test: 'data',
  }.to_json
end

post'/transcribe' do
  file = File.open('fixtures/hello.wav')
  transcriber = Transcriber.new(file, params[:file_type])
  transcriber.transcribe!
  {
    test: 'data',
    hypothesis: transcriber.transcription
  }.to_json
end

