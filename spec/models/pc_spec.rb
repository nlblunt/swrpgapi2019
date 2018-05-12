require "rails_helper"

RSpec.describe Pc, type: :model do
  before(:context) do
    Player.delete_all
    #@user = create(:user)
  end

  before(:each) do
    create(:skill)
    create(:skill)
    create(:skill)
    subject.init
  end

  subject {
    build(:pc, player_id: create(:player).id, race_id: create(:race).id, career_id: create(:career).id)
  }

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

  describe "It increases skill rank" do
    it "and uses XP and suceeds" do
      skillRank = subject.pcs_skills.first.rank

      subject.xp = 100
      subject.increase_skill_rank(subject.pcs_skills.first, true)

      expect(subject.pcs_skills.first.rank).to eq(skillRank + 1)
    end

    it "and uses XP and fails" do
      skillRank = subject.pcs_skills.first.rank

      subject.xp = 0
      subject.increase_skill_rank(subject.pcs_skills.first, true)

      expect(subject.pcs_skills.first.rank).to eq(skillRank)
    end

    it "and does not use XP" do
      skillRank = subject.pcs_skills.first.rank

      subject.xp = 100
      subject.increase_skill_rank(subject.pcs_skills.first, false)

      expect(subject.pcs_skills.first.rank).to eq(skillRank + 1)
      expect(subject.xp).to eq(100)
    end

    it "and fails if rank is greater than 5" do
      skill = subject.pcs_skills.first
      skill.rank = 5
      skill.save

      subject.increase_skill_rank(subject.pcs_skills.first, false)

      expect(subject.pcs_skills.first.rank).to eq(5)
    end
  end

  describe "It increases attribute rank" do
    it "and uses XP and succeeds" do
      brawnStart = subject.brawn

      subject.xp = 100
      subject.increase_attribute("brawn")

      expect(subject.brawn).to eq(brawnStart + 1)
    end

    it "and uses XP and fails" do
      brawnStart = subject.brawn

      subject.xp = 0
      subject.increase_attribute("brawn")

      expect(subject.brawn).to eq(brawnStart)
    end

    it "and fails if rank is greater than 5" do
      subject.xp = 100
      subject.brawn = 5
      subject.save

      subject.increase_attribute("brawn")

      expect(subject.brawn).to eq(5)
    end
  end

  it "Sets a skill as career skill" do
    skill = subject.pcs_skills.first

    expect(subject.pcs_skills.first.cskill).to eq(false)

    subject.set_career_skill(skill.id)

    expect(subject.pcs_skills.first.cskill).to eq(true)
  end

  it "Gets all career skills" do
    subject.set_career_skill(Skill.first.id)

    skills = subject.get_career_skills

    expect(skills.count).to eq(1)
  end

  describe "It sets a specialization" do
    it "and fails if more than 3" do
      pending "add some examples to (or delete) #{__FILE__}"
    end

    it "succeeds if less than 3" do
      pending "add some examples to (or delete) #{__FILE__}"
    end
  end

  describe "Associations" do
    it { should belong_to(:player) }
    it { should have_many(:skills) }
    it { should belong_to(:race) }
    it { should belong_to(:career) }
    it { should have_many(:weapons) }
    it { should have_many(:armors) }
    it { should have_many(:items) }
  end
end
