# FileBuilder
class FileBuilder
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def build
    tmp_file = Tempfile.new("recording.#{params[:file_type]}")
    tmp_file.write(Base64.decode64(params[:recording]))
    tmp_file.close
    tmp_file
  end
end
