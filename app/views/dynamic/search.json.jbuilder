json.array!(@results) do |result|
  json.title result["Title"]
  json.year result["Year"]
  json.imdbID result["imdbID"]
end
