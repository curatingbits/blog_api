class CreateBlogPostAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_post_authors do |t|
      t.string :name

      t.timestamps
    end

  end
end
