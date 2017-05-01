
class Channel

  attr_reader :name, :id, :channel_options

  def initialize(name, id, options = {})
    @name = name
    @id = id
    @channel_options = options
  end

end
