# frozen_string_literal: true

require 'rails_helper'

describe 'GET request for blog_comment', type: :request do

  let!(:blog_with_comments) { create_list(:blog_comments_with_blog_post, 1) }
  let!(:author) { create(:blog_post_author) }
  let!(:post) { create(:blog_post, blog_post_author_id: author.id) }
  let!(:comment) { create_list(:blog_comment, 20, blog_post_id: post.id) }
  let!(:comment_id) { comment.first.id }

  describe 'GET all blog_comments /api/vi/blog_comments' do
    before { get '/api/v1/blog_comments' }

    it 'returns all comments' do
      expect(json.size).to eq(50)
    end

    it 'expects status code to reutrn 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /api/v1/blog_comments/:id', type: :request do
    before { get "/api/v1/blog_comments/#{comment_id}" }

    context 'when the record exists' do
      it 'returns the comment' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(comment_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      context 'when the record doesnt exist' do
        let(:comment_id) { 1_000 }

        it 'returns status of 404' do
          expect(response).to have_http_status(404)
        end

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find BlogComment/)
        end
      end
    end
  end
end
