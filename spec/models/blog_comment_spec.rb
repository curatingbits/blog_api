# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlogComment, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:body) }
  it { should belong_to(:blog_post) }
end
