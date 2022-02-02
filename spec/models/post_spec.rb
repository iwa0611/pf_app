require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "投稿する時" do
    subject { post.valid? }

    let(:post) { create(:post) }

    it "bodyが空だと投稿できない" do
      post.body = nil
      is_expected.to eq false
    end
  end
end
