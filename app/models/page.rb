class Page < Obj
  attribute :title, :string
  attribute :body, :widgetlist
  attribute :child_order, :referencelist
  attribute :tags, :stringlist
  attribute :valid_from, :date
  attribute :valid_until, :date

  default_for :valid_from do
    Time.current
  end
  default_for :valid_until do
    Time.current + 1.year
  end
  
end
