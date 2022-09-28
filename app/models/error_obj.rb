class ErrorObj

  attr_reader :message_key, :message_props, :level, :scope

  private
  #why private?

  def initialize(message_key:, message_props: {})
    @message_key = message_key
    @message_props = message_props
    @level = level
    @scope = scope
  end

end
