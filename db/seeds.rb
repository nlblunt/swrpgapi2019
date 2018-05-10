# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = Player.create(email: 'test@email.com', name: 'user', password: 'password', password_confirmation: 'password')
#user.create_player(name: 'player')

#user2 = User.create(email: 'joe@email.com', name: 'joe', password: 'password', password_confirmation: 'password')
#user2.create_player(name: 'Joe')

#user3 = User.create(email: 'chris@email.com', name: 'chris', password: 'password', password_confirmation: 'password')
#user3.create_player(name: 'Chris')

#Gm.create(email: 'gm@test.com', password: 'password', password_confirmation: 'password')

Skill.create(name: "Astrogation", attrib: "Intellect")
Skill.create(name: "Athletics", attrib: "Brawn")
Skill.create(name: "Charm", attrib: "Presence")
Skill.create(name: "Coerce", attrib: "Willpower")
Skill.create(name: "Computers", attrib: "Intellect")
Skill.create(name: "Cool", attrib: "Presence")
Skill.create(name: "Coordination", attrib: "Agility")
Skill.create(name: "Deceit", attrib: "Cunning")
Skill.create(name: "Discipline", attrib: "Willpower")
Skill.create(name: "Knowledge - Core Worlds", attrib: "Intellect")
Skill.create(name: "Knowledge - Education", attrib: "Intellect")
Skill.create(name: "Knowledge - Lore", attrib: "Intellect")
Skill.create(name: "Knowledge - Outer Rim", attrib: "Intellect")
Skill.create(name: "Knowledge - Xenology", attrib: "Intellect")
Skill.create(name: "Knowledge - Underworld", attrib: "Intellect")
Skill.create(name: "Leadership", attrib: "Presence")
Skill.create(name: "Mechanics", attrib: "Intellect")
Skill.create(name: "Medicine", attrib: "Intellect")
Skill.create(name: "Negotiation", attrib: "Presence")
Skill.create(name: "Perception", attrib: "Cunning")
Skill.create(name: "Pilot - Planet", attrib: "Agility")
Skill.create(name: "Pilot - Space", attrib: "Agility")
Skill.create(name: "Resilience", attrib: "Brawn")
Skill.create(name: "Skulduggery", attrib: "Cunning")
Skill.create(name: "Stealth", attrib: "Agility")
Skill.create(name: "Streetwise", attrib: "Cunning")
Skill.create(name: "Survival", attrib: "Cunning")
Skill.create(name: "Surveillance", attrib: "Cunning")
Skill.create(name: "Vigilance", attrib: "Willpower")

Skill.create(name: "Brawl", attrib: "Brawn")
Skill.create(name: "Gunnery", attrib: "Agility")
Skill.create(name: "Melee", attrib: "Brawn")
Skill.create(name: "Ranged - Light", attrib: "Agility")
Skill.create(name: "Ranged - Heavy", attrib: "Agility")

Race.create(name: "Bothan", agility: 2, brawn: 1, intellect: 2, presence: 2, willpower: 2, cunning: 3, wounds_thresh: 10, strain_thresh: 11, xp: 100, bonus: "Streetwise", avatar: "/assets/avatars/bothan.jpg", description: "Bothan get a Bonus Skill: Streetwise")
Race.create(name: "Droid", agility: 1, brawn: 1, intellect: 1, presence: 1, willpower: 1, cunning: 1, wounds_thresh: 10, strain_thresh: 10, xp: 175, bonus: "None", avatar: "/assets/avatars/droid.jpg", description: "Droids get a Bonus Skill: Specialization")
Race.create(name: "Gand", agility: 2, brawn: 2, intellect: 1, presence: 2, willpower: 3, cunning: 2, wounds_thresh: 10, strain_thresh: 10, xp: 100, bonus: "Discipline", avatar: "/assets/avatars/gand.jpg", description: "Gands get a Bonus Skill: Discipline")
Race.create(name: "Human", agility: 2, brawn: 2, intellect: 2, presence: 2, willpower: 2, cunning: 2, wounds_thresh: 10, strain_thresh: 10, xp: 110, bonus: "Specialty", avatar: "/assets/avatars/human.jpg", description: "Humans get a Bonus Specialty")
Race.create(name: "Rodian", agility: 3, brawn: 2, intellect: 2, presence: 2, willpower: 1, cunning: 2, wounds_thresh: 10, strain_thresh: 10, xp: 100, bonus: "Survival", avatar: "/assets/avatars/rodian.jpg", description: "Rodians get a Bonus Skill: Survival")
Race.create(name: "Trandoshan", agility: 1, brawn: 3, intellect: 2, presence: 2, willpower: 2, cunning: 2, wounds_thresh: 12, strain_thresh: 9, xp: 90, bonus: "Perception", avatar: "/assets/avatars/trandoshan.jpg", description: "trandoshans get a Bonus Skill: Perception")
Race.create(name: "Twi'lek", agility: 2, brawn: 1, intellect: 2, presence: 3, willpower: 2, cunning: 2, wounds_thresh: 10, strain_thresh: 11, xp: 100, bonus: "Charm", avatar: "/assets/avatars/twilek.jpg", description: "Twi'leks get a Bonus Skill: Charm")
#Race.create(name: "Twi'lek", agility: 2, brawn: 1, intellect: 2, presence: 3, willpower: 2, cunning: 2, wounds_thresh: 10, strain_thresh: 11, xp: 100, bonus: "Deceit")
Race.create(name: "Wookiee", agility: 2, brawn: 3, intellect: 2, presence: 2, willpower: 1, cunning: 2, wounds_thresh: 14, strain_thresh: 8, xp: 90, bonus: "Brawl", avatar: "/assets/avatars/wookiee.jpg", description: "Wookiees get a Bonus Skill: Brawl")


c1 = Career.create(name: "Bounty Hunter", description: "Career Skills: Athletics, Perception, Pilot - Planet, Pilot - Space, Streetwise, Surveillance, Vigilance, Ranged - Heavy")
c1.skills << Skill.find_by_name("Athletics")
c1.skills << Skill.find_by_name("Perception")
c1.skills << Skill.find_by_name("Pilot - Planet")
c1.skills << Skill.find_by_name("Pilot - Space")
c1.skills << Skill.find_by_name("Streetwise")
c1.skills << Skill.find_by_name("Surveillance")
c1.skills << Skill.find_by_name("Vigilance")
c1.skills << Skill.find_by_name("Ranged - Heavy")

sp1 = Specialization.create(name: "Assassin", career_id: c1.id)
sp1.skills << Skill.find_by_name("Coordination")
sp1.skills << Skill.find_by_name("Skulduggery")
sp1.skills << Skill.find_by_name("Stealth")
sp1.skills << Skill.find_by_name("Melee")

sp1 = Specialization.create(name: "Gadgeteer", career_id: c1.id)
sp1.skills << Skill.find_by_name("Computers")
sp1.skills << Skill.find_by_name("Mechanics")
sp1.skills << Skill.find_by_name("Surveillance")
sp1.skills << Skill.find_by_name("Ranged - Light")

sp1 = Specialization.create(name: "Survivalist", career_id: c1.id)
sp1.skills << Skill.find_by_name("Resilience")
sp1.skills << Skill.find_by_name("Survival")
sp1.skills << Skill.find_by_name("Knowledge - Lore")
sp1.skills << Skill.find_by_name("Knowledge - Xenology")


c1 = Career.create(name: "Colonist")
c1.skills << Skill.find_by_name("Charm")
c1.skills << Skill.find_by_name("Deceit")
c1.skills << Skill.find_by_name("Leadership")
c1.skills << Skill.find_by_name("Negotiation")
c1.skills << Skill.find_by_name("Streetwise")
c1.skills << Skill.find_by_name("Knowledge - Core Worlds")
c1.skills << Skill.find_by_name("Knowledge - Education")
c1.skills << Skill.find_by_name("Knowledge - Lore")

sp1 = Specialization.create(name: "Doctor", career_id: c1.id)
sp1.skills << Skill.find_by_name("Cool")
sp1.skills << Skill.find_by_name("Medicine")
sp1.skills << Skill.find_by_name("Resilience")
sp1.skills << Skill.find_by_name("Knowledge - Education")

sp1 = Specialization.create(name: "Politico", career_id: c1.id)
sp1.skills << Skill.find_by_name("Charm")
sp1.skills << Skill.find_by_name("Coerce")
sp1.skills << Skill.find_by_name("Deceit")
sp1.skills << Skill.find_by_name("Negotiation")

sp1 = Specialization.create(name: "Scholar", career_id: c1.id)
sp1.skills << Skill.find_by_name("Perception")
sp1.skills << Skill.find_by_name("Knowledge - Outer Rim")
sp1.skills << Skill.find_by_name("Knowledge - Underworld")
sp1.skills << Skill.find_by_name("Knowledge - Xenology")


c1 = Career.create(name: "Explorer")
c1.skills << Skill.find_by_name("Astrogation")
c1.skills << Skill.find_by_name("Charm")
c1.skills << Skill.find_by_name("Cool")
c1.skills << Skill.find_by_name("Perception")
c1.skills << Skill.find_by_name("Pilot - Space")
c1.skills << Skill.find_by_name("Knowledge - Lore")
c1.skills << Skill.find_by_name("Knowledge - Outer Rim")
c1.skills << Skill.find_by_name("Knowledge - Xenology")

sp1 = Specialization.create(name: "Fringer", career_id: c1.id)
sp1.skills << Skill.find_by_name("Astrogation")
sp1.skills << Skill.find_by_name("Coordination")
sp1.skills << Skill.find_by_name("Negotiation")
sp1.skills << Skill.find_by_name("Streetwise")

sp1 = Specialization.create(name: "Scout", career_id: c1.id)
sp1.skills << Skill.find_by_name("Athletics")
sp1.skills << Skill.find_by_name("Pilot - Planet")
sp1.skills << Skill.find_by_name("Survival")
sp1.skills << Skill.find_by_name("Surveillance")

sp1 = Specialization.create(name: "Trader", career_id: c1.id)
sp1.skills << Skill.find_by_name("Deceit")
sp1.skills << Skill.find_by_name("Negotiation")
sp1.skills << Skill.find_by_name("Knowledge - Core Worlds")
sp1.skills << Skill.find_by_name("Knowledge - Education")


c1 = Career.create(name: "Hired Gun")
c1.skills << Skill.find_by_name("Athletics")
c1.skills << Skill.find_by_name("Discipline")
c1.skills << Skill.find_by_name("Pilot - Planet")
c1.skills << Skill.find_by_name("Resilience")
c1.skills << Skill.find_by_name("Vigilance")
c1.skills << Skill.find_by_name("Brawl")
c1.skills << Skill.find_by_name("Melee")
c1.skills << Skill.find_by_name("Ranged - Light")

sp1 = Specialization.create(name: "Bodyguard", career_id: c1.id)
sp1.skills << Skill.find_by_name("Perception")
sp1.skills << Skill.find_by_name("Pilot - Planet")
sp1.skills << Skill.find_by_name("Gunnery")
sp1.skills << Skill.find_by_name("Ranged - Heavy")

sp1 = Specialization.create(name: "Marauder", career_id: c1.id)
sp1.skills << Skill.find_by_name("Coerce")
sp1.skills << Skill.find_by_name("Resilience")
sp1.skills << Skill.find_by_name("Survival")
sp1.skills << Skill.find_by_name("Melee")

sp1 = Specialization.create(name: "Mercenary Soldier", career_id: c1.id)
sp1.skills << Skill.find_by_name("Gunnery")
sp1.skills << Skill.find_by_name("Ranged - Heavy")
sp1.skills << Skill.find_by_name("Discipline")
sp1.skills << Skill.find_by_name("Leadership")


c1 = Career.create(name: "Smuggler")
c1.skills << Skill.find_by_name("Coordination")
c1.skills << Skill.find_by_name("Deceit")
c1.skills << Skill.find_by_name("Perception")
c1.skills << Skill.find_by_name("Pilot - Space")
c1.skills << Skill.find_by_name("Skulduggery")
c1.skills << Skill.find_by_name("Streetwise")
c1.skills << Skill.find_by_name("Vigilance")
c1.skills << Skill.find_by_name("Knowledge - Underworld")

sp1 = Specialization.create(name: "Pilot", career_id: c1.id)
sp1.skills << Skill.find_by_name("Astrogation")
sp1.skills << Skill.find_by_name("Pilot - Planet")
sp1.skills << Skill.find_by_name("Pilot - Space")
sp1.skills << Skill.find_by_name("Gunnery")

sp1 = Specialization.create(name: "Scoundrel", career_id: c1.id)
sp1.skills << Skill.find_by_name("Charm")
sp1.skills << Skill.find_by_name("Cool")
sp1.skills << Skill.find_by_name("Brawl")
sp1.skills << Skill.find_by_name("Ranged - Light")

sp1 = Specialization.create(name: "Thief", career_id: c1.id)
sp1.skills << Skill.find_by_name("Vigilance")
sp1.skills << Skill.find_by_name("Skulduggery")
sp1.skills << Skill.find_by_name("Stealth")
sp1.skills << Skill.find_by_name("Knowledge - Underworld")


c1 = Career.create(name: "Technician")
c1.skills << Skill.find_by_name("Astrogation")
c1.skills << Skill.find_by_name("Computers")
c1.skills << Skill.find_by_name("Coordination")
c1.skills << Skill.find_by_name("Discipline")
c1.skills << Skill.find_by_name("Mechanics")
c1.skills << Skill.find_by_name("Perception")
c1.skills << Skill.find_by_name("Pilot - Planet")
c1.skills << Skill.find_by_name("Surveillance")

sp1 = Specialization.create(name: "Mechanic", career_id: c1.id)
sp1.skills << Skill.find_by_name("Mechanics")
sp1.skills << Skill.find_by_name("Pilot - Space")
sp1.skills << Skill.find_by_name("Skulduggery")
sp1.skills << Skill.find_by_name("Brawl")

sp1 = Specialization.create(name: "Outlaw Tech", career_id: c1.id)
sp1.skills << Skill.find_by_name("Mechanics")
sp1.skills << Skill.find_by_name("Streetwise")
sp1.skills << Skill.find_by_name("Knowledge - Education")
sp1.skills << Skill.find_by_name("Knowledge - Underworld")

sp1 = Specialization.create(name: "Slicer", career_id: c1.id)
sp1.skills << Skill.find_by_name("Computers")
sp1.skills << Skill.find_by_name("Surveillance")
sp1.skills << Skill.find_by_name("Knowledge - Education")
sp1.skills << Skill.find_by_name("Knowledge - Underworld")

##########
# Armor  #
##########
Armor.create(name: "Heavy Clothing", defense: 0, soak: 0, price: 50, description: "A good leather jacket...")

###########
# Weapons #
###########
Weapon.create(name: "Holdout Blaster", skill_id: Skill.find_by_name("Ranged - Light").id, damage: 5, critical: 4, range: "Short", price: 300, special: "Stun Setting", notes: "Can switch to stun setting to cause strain damage instead of wounds")