json.array! @posts do |post|
  json.id           post.id
  json.title        post.title
  json.image        post.image
  json.user_id      post.user_id
  json.created_at   post.created_at
  json.message      post.message
  json.user  post.user
end