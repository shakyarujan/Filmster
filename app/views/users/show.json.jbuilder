json.id @user.id
json.username @user.username
json.introduction @user.introduction
json.photo_url @user.photo_url
json.reviews do
  json.array! @user.reviews do |review|
    json.movie review.movie, :title, :id, :year, :imdbrating, :imdbid, :poster
    json.comment review.comment
  end
end