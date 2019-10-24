# frozen_string_literal: true

FactoryBot.define do
  factory :blog_comment do
    name { "MyString" }
    body { "MyText" }
    blog_post { nil }

    factory :comments_with_blog_posts do
      after(:create) do |comment|
        create_list(:blog_post, 1, comment: comment)
      end
    end
  end

  factory :blog_post_author do
    name { Faker::Name.name }

    factory :blog_post_author_with_blog_post do
      after(:create) do |blog_post_author|
        create_list(:blog_post, 20, blog_post_author: blog_post_author)
      end
    end
  end

  factory :blog_post do
    title { Faker::Lorem.sentence }
    body  { Faker::Lorem.paragraphs }
    blog_post_author

    factory :blog_comments_with_blog_post do
      after(:create) do |blog_comment|
        create_list(:blog_comment, 30, blog_post: blog_comment)
      end
    end
  end
end
