require_relative('../models/adoption.rb')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/trainer.rb')
require('pry-byebug')

Adoption.delete_all()
Animal.delete_all()
Owner.delete_all()
Trainer.delete_all()


owner1 = Owner.new(
    "first_name" => "Donald",
    "last_name" => "Trumpirooni"
)

owner1.save()

animal1 = Animal.new(
    "name" => "Stevie",
    "species" => "Lizard",
    "breed" => "Argus monitor",
    "age" => 2,
    "adoptable" => true,
    "admission_date" => "03/02/2018"
)

animal1.save()

trainer1 = Trainer.new(
    "first_name" => "Nicola",
    "last_name" => "Sturgeon",
    "fav_species" => "Bat"
)

trainer1.save()

adoption1 = Adoption.new(
    "animal_id" => animal1.id(),
    "owner_id" => owner1.id(),
    "date" => "14/03/2018"
)

adoption1.save()


binding.pry
nil