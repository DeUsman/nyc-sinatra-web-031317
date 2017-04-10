require 'pry'

class FiguresController < ApplicationController

	get '/figures' do
		erb :'/figures/index'
	end


	get '/figures/new' do 
		erb :'figures/new'
	end


	post '/figures/new' do
		@figure = Figure.create( params[:figure] )
		
		if (params[:title])
			@figure.titles.push(Title.find_or_create_by(params[:title]))
			@figure.save
		end

		if (params[:landmark])
			@figure.landmarks.push(Landmark.find_or_create_by(params[:landmark]))
			@figure.save

		end
  		redirect "/figures/#{@figure.id}"
    end


    get '/figures/:id' do
    	@figure = Figure.find(params[:id])
    	erb :'figures/show'
    end


    get '/figures/:id/edit' do
		@figure = Figure.find(params[:id])
    	erb :'/figures/edit'
    end

  
	post '/figures/:id' do
		
		@figure = Figure.find(params[:id])
		@landmark = Landmark.find_or_create_by(name: params[:figure][:landmark])
		@figure.name = params[:figure][:name]
		@figure.landmarks.push(@landmark)
		@figure.save
		erb :'figures/show'
	end
end