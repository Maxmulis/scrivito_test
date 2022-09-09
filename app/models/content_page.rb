class ContentPage < Page
  attribute :hide_from_navigation, :enum, values: %w[visible hidden], default: 'visible'
  attribute :full_screen, :enum, values: %w[no yes], default: 'no'
  # hide page from navigation
  def hidden_from_navigation?
    hide_from_navigation == 'hidden'
  end

  def full_screen?
    full_screen == 'yes'
  end
end
