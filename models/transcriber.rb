require 'pocketsphinx-ruby'
require 'tempfile'

class Transcriber
  attr_accessor :file

  def initialize(file)
    @file = file
  end

  def transcribe!
    @decoder = Pocketsphinx::Decoder.new(default_config)
    @decoder.configuration['cmninit'] = '8.0'
    @decoder.decode(@file.path)
  end

  def transcription
    @decoder.hypothesis
  end

  def default_config
    Pocketsphinx::Configuration.default
  end
end
