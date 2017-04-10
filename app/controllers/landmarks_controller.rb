class LandmarksController < ApplicationController

	get '/landmarks' do
		erb :'landmarks/index'
	end

	get '/landmarks/new' do
		erb :'landmarks/new'
	end

	post '/landmarks' do 
		@landmark = Landmark.find_or_create_by(params[:landmark])
		erb :'landmarks/show'
		#binding.pry
	end

	get '/landmarks/:id' do 
		@landmark = Landmark.find(params[:id])
		erb :'landmarks/show'
	end

	get '/landmarks/:id/edit' do
		@landmark = Landmark.find(params[:id])
		erb :'landmarks/edit'
	end

	post '/landmarks/:id' do
		@landmark = Landmark.find(params[:id])
		@landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed].to_i)
		erb :'landmarks/show'
	end
end
