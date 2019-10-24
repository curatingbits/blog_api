# frozen_string_literal: true

require 'rails_helper'
describe 'GET requests for blog_post_author', type: :request do
  # Mass assignment of 20 blogs per author
  let!(:author_blog) { create_list(:blog_post_author_with_blog_post, 1) }
  let!(:author) { create_list(:blog_post_author, 5) }
  let!(:author_id) { author.first.id }

  describe 'GET all blog_post_author /api/v1/blog_post_authors' do
    before { get '/api/v1/blog_post_authors' }

    it 'returns all authors' do
      expect(json.size).to eq(6)
    end

    it 'expects status code to return 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /api/v1/blog_post_authors/:id' do
    before { get "/api/v1/blog_post_authors/#{author_id}" }

    context 'when a record exists' do
      it 'returns the post' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(author_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      context 'when the record doesnt exist' do
        let(:author_id) { 1_000 }

        it 'returns status of 404' do
          expect(response).to have_http_status(404)
        end

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find BlogPostAuthor/)
        end
      end
    end
  end
end
