# frozen_string_literal: true

module Api
  module V1
    # BlogPosts Controller class handles all CRUD endpoints
    class BlogPostsController < ApplicationController
      before_action :set_blog_post, only: %i[show update destroy blog_post_comments]
      def index
        @posts = BlogPost.all
        json_response(@posts)
      end

      def show
        json_response(@blog_post)
      end

      def blog_post_comments
        render json: @blog_post.to_json(include: :blog_comment)
      end

      def create
        @post = BlogPost.create!(blog_post_params)
        json_response(@post, :created)
      end

      def update
        @blog_post.update(blog_post_params)
        head :no_content
      end

      def destroy
        @blog_post.destroy
        head :no_content
      end

      private

      def set_blog_post
        @blog_post = BlogPost.find(params[:id])
      end

      def blog_post_params
        params.require(:blog_post).permit(:title, :body, blog_post_author_attributes: %i[id name])
      end
    end
  end
end
