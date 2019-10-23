# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlogPostAuthor, type: :model do
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:blog_posts).dependent(:nullify) }
  it { should validate_presence_of(:name) }
end
