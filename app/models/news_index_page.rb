class NewsIndexPage < Page
  attribute :title, :string

  default_for :_path do |attributes|
    "/news"
  end
end
