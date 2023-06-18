class SerializablePet < JSONAPI::Serializable::Resource 
    type 'pets'
    
    attributes :id, :name, :age, :breed, :color, :favorite_food, :favorite_toy, :featured, :star_pet, :species
end