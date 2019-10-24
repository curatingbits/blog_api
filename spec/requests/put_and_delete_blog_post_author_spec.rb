# frozen_string_literal: true

require 'rails_helper'

describe 'update blog_post_author', type: :request do
  let!(:author) { create(:blog_post_author) }
  let!(:author_id) { author.id }

  describe 'PUT /api/v1/blog_post_author' do
    let(:valid_attributes) { { blog_post_author: { name: Faker::Name.name } } }

    context 'when a record exists' do
      before { put "/api/v1/blog_post_authors/#{author_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end
    end
  end
  describe 'DELETE /api/v1/blog_post_authors:id' do
    before { delete "/api/v1/blog_post_authors/#{author_id}", params: {} }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
