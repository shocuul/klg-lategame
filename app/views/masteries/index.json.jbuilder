json.array!(@masteries) do |mastery|
  json.extract! mastery, :name, :description
  json.url mastery_url(mastery, format: :json)
end
