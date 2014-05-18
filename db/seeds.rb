# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Problem.destroy_all
Content.destroy_all
Rating.destroy_all

a = Problem.create(name: 'I want to find my passion', video_url: 'http://youtu.be/EI0tsBZlp6Q')
b = Content.create(
  [
    { video_url: 'http://youtu.be/gP5WQtAHTfw' },
    { video_url: 'http://youtu.be/TdkOVLSTc_U' },
    { video_url: 'http://www.youtube.com/watch?v=vPKfTt1xa1I' },
    { video_url: 'http://youtu.be/VnZ9Hg2Rx8g' },
    { video_url: 'http://youtu.be/xk-gSjmsgXo' }
  ])

a.contents << b
