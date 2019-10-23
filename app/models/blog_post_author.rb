class BlogPostAuthor < ApplicationRecord
  has_many :blog_posts, dependent: :nullify
  validates :name, uniqueness: true
  validates_presence_of :name

end
