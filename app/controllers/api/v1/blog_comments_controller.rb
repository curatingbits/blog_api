# frozen_string_literal: true

module Api
  module V1
    # Controller actions for BlogComments
    class BlogCommentsController < ApplicationController
      before_action :set_blog_comment, only: %i[show update destroy]
      def index
        @comment = BlogComment.all
        json_response(@comment)
      end

      def show
        json_response(@blog_comment)
      end

      def create
        @comment = BlogComment.create!(blog_comment_params)
        json_response(@comment, :created)
      end

      def update
        @blog_comment.update(blog_comment_params)
        head :no_content
      end

      def destroy
        @blog_comment.destroy
        head :no_content
      end

      private

      def set_blog_comment
        @blog_comment = BlogComment.find(params[:id])
      end

      def blog_comment_params
        params.require(:blog_comment).permit(:name, :body, :blog_post_id)
      end
    end
  end
end
