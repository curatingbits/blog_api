# frozen_string_literal: true

FactoryBot.define do
  factory :create_blog_post  do
    title { Faker::Lorem.scentence }
    body { Faker::Lorem.paragraphs }
    date { Faker::Time.backward(days: 90) }
  end
end
