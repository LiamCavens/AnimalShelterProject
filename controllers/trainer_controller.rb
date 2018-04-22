require( 'sinatra' )
require('sinatra/contrib/all')
require_relative('../models/trainer.rb')

get '/trainers' do
    @trainers = Trainer.all()
    erb (:"trainers/index")
end

get '/trainers/new' do 
    @trainers = Trainer.all()
    erb(:"trainers/new")
end

get '/trainers/:id' do
    @trainer = Trainer.find(params['id'].to_i)
    erb(:"trainers/show")
end

post '/trainers' do
    trainer = Trainer.new(params)
    trainer.save()
    redirect to "/trainers"
end