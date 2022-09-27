class ErrorObj

  attr_reader :message_key, :message_props, :level, :scope

  private

  def initialize(message_key:, message_props: {}, level: ErrorLevel::ERROR, scope: ErrorScope::DEFAULT)
    @message_key = message_key
    @message_props = message_props
    @level = level
    @scope = scope
  end

end
