require 'rails_helper'

NAME = "Steven"
CONTENT = "Good morning"
COMMENT_CONTENT = "Good morning too"
NOT_FOUND_ID = "ABCDE"
NEW_NAME = "John Doe"
NEW_CONTENT = "Good afternoon"

RSpec.describe "StatusUpdates", type: :request do
    context "HTTP requests" do
        before(:each) do
            @status = StatusUpdate.new(name: NAME, content: CONTENT)
            @status.save
      
            @comment_one = @status.comment.create(content: COMMENT_CONTENT)
            @comment_two = @status.comment.create(content: COMMENT_CONTENT)
        end
        
        it "GET /status should return all status updates" do
            get "/status"
            expect(response.parsed_body.length).to eq(1)
            expect(response.parsed_body[0]["id"]).to eq(@status.id)
        end
        
        it "GET /status/:id should return the specific status id w/ comments" do
            get "/status/#{@status.id}"
            expect(response.parsed_body["success"]).to be true
            expect(response.parsed_body["content"]["id"]).to eq(@status.id)
            expect(response.parsed_body["content"]["comments"].length).to eq(2)
        end

        it "GET /status/:id not found should fail" do
            get "/status/#{NOT_FOUND_ID}"
            expect(response.parsed_body["success"]).to be false
        end

        it "POST /status should create with correct data" do
            post "/status", :params => {
                "name": NEW_NAME,
                "content": NEW_CONTENT
            }
            expect(response.parsed_body["success"]).to be true
            expect(StatusUpdate.all.length).to eq(2)
        end

        it "POST /status shouldn't create with incomplete data" do
            post "/status", :params => {
                "name": NEW_NAME
            }
            expect(response.parsed_body["success"]).to be false
            expect(StatusUpdate.all.length).to eq(1)
        end

        it "DELETE /status/:id should delete the status and comments" do
            delete "/status/#{@status.id}"
            expect(StatusUpdate.all.length).to eq(0)
            expect(Comment.all.length).to eq(0)
        end

        it "PUT /status/:id should edit the status update w/ correct data" do
            put "/status/#{@status.id}", :params => {
                "name": NEW_NAME,
                "content": NEW_CONTENT
            }
            expect(StatusUpdate.find(@status.id).name).to eq(NEW_NAME)
            expect(StatusUpdate.find(@status.id).content).to eq(NEW_CONTENT)
        end

        it "PUT /status/:id with incorrect data shouldn't update" do
            put "/status/#{@status.id}", :params => {
                "name": NEW_NAME
            }
            expect(StatusUpdate.find(@status.id).name).to eq(NAME)
            expect(StatusUpdate.find(@status.id).content).to eq(CONTENT)
        end 
    end
end
