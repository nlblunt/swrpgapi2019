class Race < ApplicationRecord
  #Required fields
  validates_presence_of :name, :brawn, :agility, :intellect, :cunning, :willpower
  #belongs_to :pc
end
