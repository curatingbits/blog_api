# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/blog_comments' do
  let!(:author) { create(:blog_post_author) }
  let!(:posts) { create(:blog_post, blog_post_author_id: author.id) }
  let!(:post_id) { posts.id }
  let(:valid_attributes) do
    { blog_comment: { name: 'test_name', body: 'test_body', blog_post_id: post_id } }
  end

  context 'when request is valid' do
    before { post '/api/v1/blog_comments', params: valid_attributes }

    it 'reutrns a name' do
      expect(json['name']).to eq('test_name')
    end

    it 'returns a body' do
      expect(json['body']).to eq('test_body')
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end

    context 'when request is invalid' do
      let(:invalid_attributes) { { blog_comment: { name: nil, body: nil, blog_post_id: nil } } }
      before { post '/api/v1/blog_comments', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
