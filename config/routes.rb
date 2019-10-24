# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :blog_posts do
        get 'blog_post_comments', on: :member
      end
      resources :blog_post_authors do
        get 'author_blog_posts', on: :member
        get 'authors_latest_post', on: :collection
      end
      resources :blog_comments
    end
  end
end
