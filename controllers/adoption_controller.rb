require( 'sinatra' )
require('sinatra/contrib/all')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/adoption.rb')

get '/adoptions' do
    @adoptions = Adoption.all()
    erb(:'adoptions/index')
end

get '/adoptions/new' do
    @animals = Adoption.adoptable_animal()
    @owners = Owner.all()
    erb(:'adoptions/new')
end

post '/adoptions' do
    adoption = Adoption.new(params)
    adoption.save()
    redirect to('/adoptions')
end

post "/adoptions/:id/delete" do
    adoption_delete = Adoption.find(params['id'].to_i)
    adoption_delete.delete()
    redirect to "/adoptions"
end