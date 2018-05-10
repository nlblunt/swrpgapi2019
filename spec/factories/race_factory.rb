FactoryBot.define do
  factory :race do
    name "Human"
    xp 100
    brawn 2
    agility 2
    intellect 2
    cunning 2
    willpower 2

    wounds_thresh 10
    strain_thresh 10
    description "Some description stuff here."
  end
end
