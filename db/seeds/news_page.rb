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

# Create a NewsIndexPage
NewsIndexPage.create(title: 'News')
# Create a valid page
p = NewsPage.create(title: "Live")
p.update(valid_from: Time.current - 1.day, valid_until: Time.current + 1.day, _path: '/news/live')
puts "Created live page"
puts "Path: #{p.path}"

p = NewsPage.create(title: "Live")
p.update(valid_from: Time.current - 1.day, valid_until: Time.current + 1.day)
puts "Created live page"
puts "Path: #{p.path}"

# Create an expired page
p = NewsPage.create(title: "Expired")
p.update(valid_from: Time.current - 2.days, valid_until: Time.current - 1.day)
puts "Created expired page"
puts "Path: #{p.path}"

# Create a future page
p = NewsPage.create(title: "Future")
p.update(valid_from: Time.current + 1.day, valid_until: Time.current + 2.days)
puts "Created future page"

# Create a page with no valid_from
p = NewsPage.create(title: "No valid_from")
p.update(valid_until: Time.current + 2.days, valid_from: nil)
puts "Created no valid_from page"

# Create a page with no valid_until
p = NewsPage.create(title: "No valid_until")
p.update(valid_from: Time.current - 2.days, valid_until: nil)
puts "Created no valid_until page"