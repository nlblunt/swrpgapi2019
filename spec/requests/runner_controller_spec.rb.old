require 'rails_helper'

RSpec.describe RunnerController, :type => :request do
	before(:context) do
		User.delete_all
		@user = create(:user, email: "test2@email.com")
		@meta = create(:metatype)
	end

	subject { create(:runner, user_id: create(:user).id, metatype_id: create(:metatype).id) }


	it "creates a new Runner for the User" do
		#params = {user_id: @user.id, metatype_id: @meta.id, name: "Test Runner", concept: "Rigger"}

		post "/runner/create", params: {runner:{user_id: @user.id, metatype_id: @meta.id, name: "Test Runner", concept: "Rigger"}}
		
		expect(Runner.count).to eq(1)
	end

	describe "increases attributes" do
		it "and returns success on valid request" do
			post "/runner/increase_attribute", params: {runner_id: subject.id, attrib: "body", amount: 1}
			expect(response).to have_http_status(:success)
		end
		it "and returns error on invalid request" do
			post "/runner/increase_attribute", params: {runner_id: subject.id, attrib: "body", amount: 100}
			expect(response).to have_http_status(:bad_request)
		end
	end
end
