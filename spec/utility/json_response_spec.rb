load './app/utility/json_response.rb'

OBJ = {"Hello" => "World"}
SUCCESS_STATUS = false

RSpec.describe "Comments", type: :request do
    context "Test methods" do
        it "Make sure build_response method is working" do
            result = JsonResponse.build_response(OBJ, SUCCESS_STATUS)
            expect(result[:success]).to eq(SUCCESS_STATUS)
            expect(result[:content]).to eq(OBJ)
        end
    end
end