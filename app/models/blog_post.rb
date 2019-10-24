# frozen_string_literal: true

# BlogPost Model
class BlogPost < ApplicationRecord
  validates :title, presence: true
  belongs_to :blog_post_author
  has_many :blog_comment, dependent: :destroy
  accepts_nested_attributes_for :blog_post_author

  def blog_post_author_attributes=(value)
    self.blog_post_author = BlogPostAuthor.find_or_create_by(value)
  end
end
