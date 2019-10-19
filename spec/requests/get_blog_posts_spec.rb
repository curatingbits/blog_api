# frozen_string_literal: true

require 'rails_helper'

describe 'get all blog posts by route', :type => :request do
  let!(:posts) { FactoryBot.create_list(:create_blog_post, 20) }

  before { get '/api/v1/blog_posts' }

  it 'returns all posts' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
end
