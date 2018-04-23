require( 'sinatra' )
require('sinatra/contrib/all')
require_relative('../models/animal.rb')

get '/animals' do
    @animals = Animal.all()
    erb (:"animals/index")
end

get '/animals/new' do 
    @animals = Animal.all
    erb(:"animals/new")
end

get '/animals/:id' do
    @animal = Animal.find(params['id'].to_i)
    erb(:"animals/show")
end

post '/animals' do
    animal = Animal.new(params)
    animal.save()
    redirect to "/animals"
end

get "/animals/:id/edit" do
    @animal = Animal.find(params['id'].to_i)
    erb(:"animals/edit")
end

post "/animals/:id/edit" do
    animal = Animal.new(params)
    animal.update()
    redirect to "/animals"
end

post "/animals/:id/delete" do
    animal_delete = Animal.find(params['id'].to_i)
    animal_delete.delete()
    redirect to "/animals"
end