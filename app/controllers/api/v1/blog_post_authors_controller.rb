# frozen_string_literal: true

module Api
  module V1
    # BlogPostAuthor
    class BlogPostAuthorsController < ApplicationController
      before_action :set_blog_post_author, only: %i[show update destroy author_blog_posts]
      def index
        @authors = BlogPostAuthor.all
        json_response(@authors)
      end

      # Returns Author with all associated BlogPost
      def author_blog_posts
        render json: @blog_post_author.to_json(include: :blog_posts)
      end

      # Returns a list of Authors with their latest post.
      def authors_latest_post
        @authors = BlogPostAuthor.author_latest_post
        json_response(@authors)
      end

      def show
        json_response(@blog_post_author)
      end

      def create
        @author = BlogPostAuthor.create!(blog_post_author_params)
        json_response(@author, :created)
      end

      def update
        @blog_post_author.update(blog_post_author_params)
        head :no_content
      end

      def destroy
        @blog_post_author.destroy
        head :no_content
      end

      private

      def set_blog_post_author
        @blog_post_author = BlogPostAuthor.find(params[:id])
      end

      def blog_post_author_params
        params.require(:blog_post_author).permit(:name, :id)
      end
    end
  end
end
