# frozen_string_literal: true

FactoryBot.define do
  factory :blog_comment do
    name { Faker::Name.name }
    body { Faker::Lorem.paragraph }
    blog_post { nil }
  end

  factory :blog_post_author do
    name { Faker::Name.name }
  end

  factory :blog_post do
    title { Faker::Lorem.sentence }
    body  { Faker::Lorem.paragraphs }
    blog_post_author
  end
end
