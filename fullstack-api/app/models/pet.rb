class Pet < ApplicationRecord
    include Filterable
    validates :name, presence: true
    validates :species, presence: true
    validates :age, presence: true
    validates :color, presence: true
    validates :breed, presence: true
    validates :favorite_food, presence: true
    validates :favorite_toy, presence: true
    validates :featured, presence: true
    validates :star_pet, presence: true
end
