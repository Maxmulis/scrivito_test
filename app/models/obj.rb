class Obj < Scrivito::BasicObj
  def method_missing(method, *args, &block)
    if method.to_s == 'hidden_from_navigation?'
      false
    else
      super
    end
  end

  def respond_to_missing?(method, include_private = false)
    method.to_s == 'hidden_from_navigation?' || super
  end
end
