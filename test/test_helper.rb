# test_helper.rb
ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'

require File.expand_path '../../pocketsphinx_app.rb', __FILE__

