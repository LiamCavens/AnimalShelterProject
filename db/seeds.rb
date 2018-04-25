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

owner2 = Owner.new(
    "first_name" => "Aldo",
    "last_name" => "Russell"
)

owner2.save()

animal1 = Animal.new(
    "name" => "Stevie",
    "species" => "Lizard",
    "breed" => "Argus Monitor",
    "age" => 2,
    "adoptable" => true,
    "admission_date" => "2018-02-03"
)

animal1.save()

animal2 = Animal.new(
    "name" => "Malcolm",
    "species" => "Horse",
    "breed" => "Mini",
    "age" => 10,
    "adoptable" => false,
    "admission_date" => "2017-08-13"
)

animal2.save()

animal3 = Animal.new(
    "name" => "Pegasus",
    "species" => "Unicorn",
    "breed" => "Magical",
    "age" => 5,
    "adoptable" => true,
    "admission_date" => "2016-04-13",
)

animal3.save()

trainer1 = Trainer.new(
    "first_name" => "Nicola",
    "last_name" => "Sturgeon",
    "fav_species" => "Bat"
)

trainer1.save()

trainer2 = Trainer.new(
    "first_name" => "Micheal",
    "last_name" => "Jackson",
    "fav_species" => "Russian Dwarf Hamster"
)

trainer2.save()

adoption1 = Adoption.new(
    "animal_id" => animal1.id(),
    "owner_id" => owner1.id(),
    "date" => "2018-03-14"
)

adoption1.save()


binding.pry
nil