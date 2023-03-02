class TooMuchUploadError < StandardError
  def initialize(msg = "YO BRO!!! you entered too much to upload")
    super
  end
end