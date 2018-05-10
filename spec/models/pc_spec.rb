require "rails_helper"

RSpec.describe Pc, type: :model do
  before(:context) do
    Player.delete_all
    #@user = create(:user)
  end

  subject { create(:pc, player_id: create(:player).id, race_id: create(:race).id, career_id: create(:career).id) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a valid PLAYER" do
    subject.player_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a valid RACE" do
    subject.race_id = nil
    expect(subject).to_not be_valid
  end

  ### NOT VALID WITHOUT ANY ATTRIBUTE MISSING
  it "is not valid without any attribute missing" do
    subject.brawn = nil
    subject.agility = nil
    subject.intellect = nil
    subject.cunning = nil
    subject.willpower = nil
    subject.presence = nil
    expect(subject).to_not be_valid
  end

  it "starts with RACE starting values" do
    subject.init
    subject.reload

    expect(subject.agility).to eq(subject.race.agility)
    expect(subject.brawn).to eq(subject.race.brawn)
    expect(subject.intellect).to eq(subject.race.intellect)
    expect(subject.cunning).to eq(subject.race.cunning)
    expect(subject.willpower).to eq(subject.race.willpower)
    expect(subject.presence).to eq(subject.race.presence)
  end

  describe "Associations" do
    it { should belong_to(:player) }
    it { shoudd have_many(:skills) }
    it { should belong_to(:race) }
    it { should belong_to(:career) }
    it { should have_many(:weapons) }
    it { should have_many(:armors) }
    it { should have_many(:items) }
  end
end
