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