#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base 
end

class Barber < ActiveRecord::Base 
end

class Contact < ActiveRecord::Base
end


before  do
	@barbers = Barber.all
end

get '/' do
	@barbers = Barber.order "created_at DESC"
	erb :index
end


get '/visit' do
	erb :visit
end

post '/visit' do

	@name = params[:name]
	@phone = params[:phone]
	@dateStamp = params[:dateStamp]
	@barber = params[:barber]
	@color = params[:color]

	Client.create :name => @name, :phone => @phone, :dateStamp => @dateStamp, :barber => @barber, :color => @color

	erb "Спасибо, #{@name}! #{@barber} с нетерпением будет ждать Вас #{@dateStamp}!"

end

get '/contacts' do
	erb :contacts
end

post '/contacts' do 



end
