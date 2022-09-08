class ContentPage < Page
  attribute :hide_from_navigation, :enum, values: %w[visible hidden], default: 'visible'

  # hide page from navigation
  def hidden_from_navigation?
    hide_from_navigation == 'hidden'
  end

end
