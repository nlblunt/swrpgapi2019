require 'rails_helper'

RSpec.describe Race, type: :model do
  subject { create(:race) }

    it "is valid with valid attributes" do
  		expect(subject).to be_valid
  	end

  	it "is not valid without a name" do
  		subject.name = nil
  		expect(subject).to_not be_valid
  	end

		it "is not valid without a brawn value" do
			subject.brawn = nil
			expect(subject).to_not be_valid
		end
		
  	describe "associations" do
  		it { should have_many(:pcs) }
  	end
end
