require 'rails_helper'

NAME = "Steven"
CONTENT = "Good morning"
COMMENT_CONTENT = "Good morning too"

RSpec.describe "Comments", type: :request do
    context "HTTP requests" do
        before(:each) do
            @status = StatusUpdate.new(name: NAME, content: CONTENT)
            @status.save
      
            @comment_one = @status.comment.create(content: COMMENT_CONTENT)
            @comment_two = @status.comment.create(content: COMMENT_CONTENT)
        end

        it "POST /comment/:status_id should add a comment" do
            post "/comment/#{@status.id}", :params => {
                "content": COMMENT_CONTENT
            }
            expect(response.parsed_body["success"]).to be true
            expect(StatusUpdate.find(@status.id).get_comment_count).to eq(3)
        end

        it "DELETE /comment/:comment_id should delete the comment" do
            delete "/comment/#{@comment_one.id}"
            expect(Comment.all.length).to eq(1)
        end

    end
end
