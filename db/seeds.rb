require 'faker'

User.destroy_all

user1 = User.new({name: "Bibi", email: "bibi@email.com", password: "test1234", description: "this is a description", picture: "https://picsum.photos/600"})
user1.save

user2 = User.new({name: "Andre", email: "andre@email.com", password: "test1234", description: "this is a description", picture: "https://picsum.photos/600"})
user2.save
5.times do |_n|
  post = Post.new({title: Faker::Book.title, content: Faker::Lorem.paragraph})
  post.user = user1
  post.save

  comment = Comment.new({content: Faker::Fantasy::Tolkien.poem})
  comment.post = post
  comment.user = user2
  comment.save
end

3.times do |_n|
  post = Post.new({title: Faker::Book.title, content: Faker::Lorem.paragraph})
  post.user = user2
  post.save

  comment = Comment.new({content: Faker::Fantasy::Tolkien.poem})
  comment.post = post
  comment.user = user1
  comment.save
end
