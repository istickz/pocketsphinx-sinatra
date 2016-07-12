require File.expand_path '../test_helper.rb', __FILE__
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
    assert_equal 'try POST silly', json['message']
  end

  def test_transcribe_post
    puts file.path
    post '/transcribe', recording: encoded_file, file_type: 'wav'
    assert json['hypothesis']
  end

  private

  def json
    JSON.parse(last_response.body)
  end

  def file
    File.open('fixtures/hello.wav')
  end

  def encoded_file
    Base64.encode64(file.read)
  end
end
