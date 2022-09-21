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

# Create a valid page
p = NewsPage.create(title: "Live")
p.update(valid_from: Time.current - 1.day, valid_until: Time.current + 1.day, _path: "/live")
puts "Created live page"

# Create an expired page
p = NewsPage.create(title: "Expired")
p.update(valid_from: Time.current - 2.days, valid_until: Time.current - 1.day, _path: "/expired")
puts "Created expired page"

# Create a future page
p = NewsPage.create(title: "Future")
p.update(valid_from: Time.current + 1.day, valid_until: Time.current + 2.days, _path: "/future")
puts "Created future page"

# Create a page with no valid_from
p = NewsPage.create(title: "No valid_from")
p.update(valid_until: Time.current + 2.days, valid_from: nil, _path: "/no-valid-from")
puts "Created no valid_from page"

# Create a page with no valid_until
p = NewsPage.create(title: "No valid_until")
p.update(valid_from: Time.current - 2.days, valid_until: nil, _path: "/no-valid-until")
puts "Created no valid_until page"