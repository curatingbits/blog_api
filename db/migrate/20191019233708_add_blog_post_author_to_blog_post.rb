class AddBlogPostAuthorToBlogPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :blog_posts, :blog_post_author, null: false, foreign_key: true
  end
end
