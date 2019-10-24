# frozen_string_literal: true

require 'rails_helper'

describe 'GET all comments for blog post' do
  let!(:author) { create(:blog_post_author) }
  let!(:author_id) { author.id }
  let!(:blog_post) { create(:blog_post, blog_post_author_id: author_id) }
  let!(:blog_post_id) { blog_post.id }
  let!(:comments) { create_list(:blog_comment, 20, blog_post_id: blog_post_id) }

  describe 'get all comments for blog post', type: :request do
    before { get "/api/v1/blog_posts/#{blog_post_id}/blog_post_comments" }

    context 'return all comments for blog post' do
      it 'returns a blog post with associated commends' do
        expect(json).not_to be_empty
      end
    end
  end
end
