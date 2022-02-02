require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "投稿する時" do
    subject { comment.valid? }

    let(:comment) { create(:comment) }

    it "bodyが空だと投稿できない" do
      comment.body = nil
      is_expected.to eq false
    end
  end
end
