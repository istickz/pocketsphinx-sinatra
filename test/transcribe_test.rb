require File.expand_path '../test_helper.rb', __FILE__
require 'json'
require 'base64'

class TranscribeTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_transcribe
    get '/transcribe'
    assert last_response.ok?
    puts last_response.body
    assert_equal 'data', json['test']
  end

  def test_transcribe_post
    post '/transcribe', recording: nil, file_type: 'wav'
    assert json['hypothesis']
  end

  private

  def json
    JSON.parse(last_response.body)
  end

  def file
    File.read('fixtures/hello.wav')
  end

  def encoded_file
    Base64.encode64(file)
  end
end

