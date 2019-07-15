json.array! @rankings do |ranking|
  json.name ranking.name
  json.id ranking.id
  json.user_name ranking.user.name
  json.time ranking.created_at.strftime("%Y-%m-%d")
  json.items ranking.items do |item|
    json.votes_length item.votes.length
  end
end
