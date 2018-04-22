require( 'sinatra' )
require('sinatra/contrib/all')
require_relative('../models/owner.rb')

get '/owners' do
    @owners = Owner.all()
    erb (:"owners/index")
end

get '/owners/new' do 
    @owners = Owner.all()
    erb(:"owners/new")
end

get '/owners/:id' do
    @owner = Owner.find(params['id'].to_i)
    erb(:"owners/show")
end

post '/owners' do
    animal = Owner.new(params)
    animal.save()
    redirect to "/owners"
end