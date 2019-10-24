# frozen_string_literal: true

# BlogPostAuthor Model and Validations
class BlogPostAuthor < ApplicationRecord
  has_many :blog_posts, dependent: :nullify
  validates :name, uniqueness: true
  validates :name, presence: true

  def self.author_latest_post
    # Drawback, if authors have lots of posts, because we fetch all post from all users (N+1),
    # would strain the database.
    # Consider refactoring if application grows. Could consider eagerloading.
    includes(:blog_posts).all.map { |a| { blog_post_author: a.name, blog_post: a.blog_posts.last } }.to_json
  end
end
