# frozen_string_literal: true

require 'rails_helper'

describe 'update blog_comment', type: :request do
  let!(:author) { create(:blog_post_author) }
  let!(:posts) { FactoryBot.create_list(:blog_post, 10, blog_post_author_id: author.id) }
  let!(:post_id) { posts.first.id }
  let!(:comment) { create(:blog_comment, blog_post_id: post_id) }
  let!(:comment_id) { comment.id }

  describe 'PUT /api/v1/blog_comments' do
    let(:valid_attributes) { { blog_comment: { name: Faker::Name.name } } }

    context 'when the record exists' do
      before { put "/api/v1/blog_comments/#{comment_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end
    end
  end
  describe 'DELETE /api/v1/blog_comments:id' do
    before { delete "/api/v1/blog_comments/#{comment_id}", params: {} }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
