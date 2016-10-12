require 'pocketsphinx-ruby'
require 'tempfile'

class Transcriber
  attr_accessor :file
  MODELS_PATH = '/Users/temur/work/speech/models/'

  def initialize(file)
    @file = file
  end

  def transcribe!
    @decoder = Pocketsphinx::Decoder.new(custom_config)
    @decoder.configuration['cmninit'] = '8.0'
    @decoder.decode(@file.path)
  end

  def transcription
    @decoder.hypothesis
  end

  def default_config
    Pocketsphinx::Configuration.default
  end

  def custom_config
    config = default_config
    # config['dict'] = MODELS_PATH + 'cmudict/' + 'cmudict.dict'
    # config['lm']   = MODELS_PATH + 'en-70k-0.2.lm'
    # config['hmm']  = MODELS_PATH + 'cmusphinx-en-us-5.2'
    # config
  end
end


