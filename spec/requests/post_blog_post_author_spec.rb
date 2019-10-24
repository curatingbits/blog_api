# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/blog_post_authors' do
  let!(:author) { FactoryBot.create(:blog_post_author) }
  let(:valid_attributes) do
    { blog_post_author: { name: 'Duggan Roberts' } }
  end

  context 'when request is valid' do
    before { post '/api/v1/blog_post_authors', params: valid_attributes, as: :json }

    it 'returns a name do' do
      expect(json['name']).to eq('Duggan Roberts')
    end

    it 'returns a created status' do
      expect(response).to have_http_status(:created)
    end
  end

  context 'when request is invalid' do
    let(:invalid_attributes) { { blog_post_author: { name: nil } } }
    before { post '/api/v1/blog_post_authors', params: invalid_attributes }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end
  end
end
