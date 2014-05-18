# Jbuilder.encode do |json|
  json.id @problem.id
  json.problem_video @problem.video_url
  json.videos @problem.contents do |v|
    json.url v.video_url
  end
# end
