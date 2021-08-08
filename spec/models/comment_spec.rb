require 'rails_helper'

NAME = "John Doe"
CONTENT = "Good afternoon"
COMMENT_CONTENT = "Good afternoon too"

RSpec.describe Comment, type: :model do
  context "Test Comment methods" do
    before(:each) do
      @status = StatusUpdate.new(name: NAME, content: CONTENT)
      @status.save

      @comment = @status.comment.create(content: COMMENT_CONTENT)
    end

    it "Make sure as_json returns needed fields" do
      expect(@status.as_json[:id]).to eq(@status.id)
      expect(@status.as_json[:content]).to eq(CONTENT)
      expect(@status.as_json[:created_at]).to eq(@status.created_at)
    end

  end
end
