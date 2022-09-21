# Find testing workspace, delete it and create a new one
begin
  workspace = Scrivito::Workspace.find_by_title('Testing')
  puts "Found testing workspace."
  workspace&.destroy
  puts "Deleted testing workspace."
  Scrivito::Workspace.create(title: 'Testing')
  puts "Created testing workspace."
rescue Scrivito::Workspace::NotFoundError
  puts 'No workspace found'
  Scrivito::Workspace.create(title: 'Testing')
end

Scrivito::Workspace.use('Testing')
puts 'Using Testing workspace'

# Create 20 pages in the workspace
20.times do |i|
  n = i + 1
  page = ContentPage.create(title: "Page #{n}")
  puts "Created page #{n}"
  page.update(_path: "/page-#{n}")
  page.update(body: [
    TextWidget.new(text: Faker::Lorem.paragraph_by_chars(number: 4000, supplemental: false))
  ])
  puts "added text widget to page #{n}"
  5.times do |i|
    num = i + 1
    page = ContentPage.create(title: "Page #{n}/#{num}")
    puts "Created page #{n}/#{num}"
    page.update(_path: "/page-#{n}/page-#{num}")
    page.update(body: [
      TextWidget.new(text: Faker::Lorem.paragraph_by_chars(number: 4000, supplemental: false))
    ])
    puts "added text widget to page #{num}"
  end
end