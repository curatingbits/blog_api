# frozen_string_literal: true

# BlogComment model class defined below.
class BlogComment < ApplicationRecord
  belongs_to :blog_post, optional: false
  validates :name, presence: true
  validates :body, presence: true
end
