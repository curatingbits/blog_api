# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  it "is not valid without a title" do
    post = BlogPost.new(title: nil)
    expect(post).to_not be_valid
  end
end
