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

get "/owners/:id/edit" do
    @owner = Owner.find(params['id'].to_i)
    erb(:"owners/edit")
end

post "/owners/:id/edit" do
    owner = Owner.new(params)
    Owner.update()
    redirect to "/owners"
end

post "/owners/:id/delete" do
    owner_delete = Owner.find(params['id'].to_i)
    owner_delete.delete()
    redirect to "/owners"
end