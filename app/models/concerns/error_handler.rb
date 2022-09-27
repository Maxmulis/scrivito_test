module ErrorHandler

  def add_error(message_key:, message_props: {})
  @errors = @errors || []
  @errors << ErrorObj.new(
    message_key: message_key,
    message_props: message_props
  )
  end

  def determine_errors
    @errors = @errors || []
  end

  def errors
    determine_errors unless @errors.present?
    @errors
  end

end