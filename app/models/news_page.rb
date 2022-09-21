class NewsPage < Page
  attribute :image, :reference
  attribute :text, :string


  def created_at_to_s
    _created_at.strftime("%a, %e %b %Y %H:%M:%S")
  end

  # all pages have valid_from and valid_until
  # what happens if it is not set
  # 

end