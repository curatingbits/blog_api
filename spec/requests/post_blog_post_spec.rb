# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/blog_posts' do
  let(:valid_attributes) do
    # rubocop:disable Metrics/LineLength
    { blog_post: { title: 'test_title', body: 'test_body', blog_post_author_attributes: { name: "Duggan Roberts" } } }
    # rubocop:enable Metrics/LineLength
  end
  context 'when request is valid' do
    before { post '/api/v1/blog_posts', params: valid_attributes }

    it 'returns a title' do
      expect(json['title']).to eq('test_title')
    end

    it 'reutrns the body' do
      expect(json['body']).to eq('test_body')
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end

    context 'when request is invalid' do
      let(:invalid_attributes) { { blog_post: { title: nil }, blog_post_author_attributes: { name: nil } } }
      before { post '/api/v1/blog_posts', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message']).to match(/Validation failed: Title can't be blank, Blog post author must exist/)
      end
    end
  end
end
