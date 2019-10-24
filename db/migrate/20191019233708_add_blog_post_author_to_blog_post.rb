# frozen_string_literal: true

# Migration to add BlogPostAuthor to BlogPost, wasn't added during TDD specs at first.
class AddBlogPostAuthorToBlogPost < ActiveRecord::Migration[6.0]
  def change
    # Disable rubocop Rails/NotNullColumn blog_post_author shouldn't be null or be created with a default value.
    # rubocop:disable Rails/NotNullColumn
    add_reference :blog_posts, :blog_post_author, null: false, foreign_key: true
    # rubocop:enable Rails/NotNullColumn
  end
end
