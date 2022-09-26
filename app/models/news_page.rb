class NewsPage < Page
  attribute :image, :reference
  attribute :text, :string

#  default_for :_path do |attributes|
#   "/news/#{attributes[:_id]}"
#  end

# create error if valid_until is 
end