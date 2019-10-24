# frozen_string_literal: true

require 'rails_helper'

describe 'GET all author posts', type: :request do
  let!(:author) { create(:blog_post_author) }
  let!(:author_id) { author.id }
  let!(:blog_post) { create_list(:blog_post, 5, blog_post_author_id: author_id) }

  describe 'GET author blogs' do
    before { get "/api/v1/blog_post_authors/#{author_id}/author_blog_posts" }

    context 'returns author with all blog posts' do
      it 'returns all blog posts' do
        expect(json).not_to be_empty
      end
    end

    describe 'GET authors with latest post' do
      before { get "/api/v1/blog_post_authors/authors_latest_post" }

      context 'returns authors with their latest post'
      it 'returns an author with the associated post' do
        expect(json).not_to be_empty
      end
    end
  end
end
