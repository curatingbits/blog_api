# frozen_string_literal: true

FactoryBot.define do
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
  end
end
