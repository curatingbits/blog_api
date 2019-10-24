# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
10.times do
  author = BlogPostAuthor.create(
    name: Faker::Name.name
  )

  5.times do
    blog = BlogPost.create(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraphs,
      blog_post_author_id: author.id
    )

    3.times do
      BlogComment.create(
        name: Faker::Name.name,
        body: Faker::Lorem.paragraphs,
        blog_post_id: blog.id
      )
    end
  end
end
