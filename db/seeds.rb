Feed.find_or_create_by!(name: "Default") do |feed|
  feed.url = "https://example.com"
  feed.description = ""
end
