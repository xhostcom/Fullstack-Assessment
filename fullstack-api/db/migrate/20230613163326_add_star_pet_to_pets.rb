class AddStarPetToPets < ActiveRecord::Migration[7.0]
  def change 
    add_column :pets, :star_pet, :boolean, default: false
  end
end
