class TextImageWidget < Widget
  attribute :text, :string
  attribute :image, :reference
  attribute :rightcolumn, :enum, values: (1..11).to_a.map(&:to_s), default: "6" # image width
  attribute :leftcolumn, :integer # text width

  def self.description_for_editor
    'Text + Image'
  end

  def leftcolumn
    12 - rightcolumn.to_i
  end
end
