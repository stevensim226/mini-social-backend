require 'rails_helper'

NAME = "Steven"
CONTENT = "Good morning"
COMMENT_CONTENT = "Good morning too"

RSpec.describe StatusUpdate, type: :model do
  context "Test status update methods" do
    before(:each) do
      @status = StatusUpdate.new(name: NAME, content: CONTENT)
      @status.save

      @comment_one = @status.comment.create(content: COMMENT_CONTENT)
      @comment_two = @status.comment.create(content: COMMENT_CONTENT)
    end

    it "Make sure as_json returns needed fields" do
      expect(@status.as_json[:id]).to eq(@status.id)
      expect(@status.as_json[:content]).to eq(CONTENT)
      expect(@status.as_json[:comment_count]).to eq(@status.get_comment_count)
      expect(@status.as_json[:created_at]).to eq(@status.created_at)
    end

    it "Make sure get comments contains correct comments" do
      expect(@status.get_comments.include? @comment_one).to be true
      expect(@status.get_comments.include? @comment_two).to be true
    end

    it "Make sure comment's count is correct amount" do
      expect(@status.get_comment_count).to eq(2)
    end

  end
end
