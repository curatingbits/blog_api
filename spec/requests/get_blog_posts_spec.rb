# frozen_string_literal: true

require 'rails_helper'

describe 'GET requests for rails_api', type: :request do
  let!(:posts) { FactoryBot.create_list(:blog_post_author_with_blog_post, 1) }
  let!(:post_id) { posts.first.id }

  describe 'GET all blog_posts /api/v1/blog_posts' do
    before { get '/api/v1/blog_posts' }

    it 'returns all posts' do
      expect(json.size).to eq(20)
    end

    it 'expects status code to return 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /api/v1/blog_posts/:id' do
    before { get "/api/v1/blog_posts/#{post_id}" }

    context 'when the record exists' do
      it 'returns the post' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(post_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record doesnt exist' do
      let(:post_id) { 1_000 }

      it 'returns status of 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find BlogPost/)
      end
    end
  end
end
