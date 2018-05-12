require "rails_helper"

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

  it "is not valid without a agility value" do
    subject.agility = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a cunning value" do
    subject.cunning = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a intellect value" do
    subject.intellect = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a willpower value" do
    subject.willpower = nil
    expect(subject).to_not be_valid
  end
end
