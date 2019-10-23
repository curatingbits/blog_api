# frozen_string_literal: true

# BlogPost Model

class BlogPost < ApplicationRecord
  validates_presence_of :title
  belongs_to :blog_post_author
  accepts_nested_attributes_for :blog_post_author, update_only: true

  def blog_post_author_attributes=(value)
    self.blog_post_author = BlogPostAuthor.find_or_create_by(value)
  end
end
