#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base 
	validates :name, presence: true, length: { minimum: 3}
	validates :phone, presence: true 
	validates :dateStamp, presence: true 
	validates :color, presence: true 
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
	@c = Client.new
	erb :visit
end

post '/visit' do

	# Запись параметров Клиента в БД

	@c = Client.new params[:client]
	if @c.save
		erb 'Спасибо, Вы записались!'
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end

=begin Ламерский? способ добавления Клиентов в таблицу
	@name = params[:name]
	@phone = params[:phone]
	@dateStamp = params[:dateStamp]
	@barber = params[:barber]
	@color = params[:color]

	Client.create :name => @name, :phone => @phone, :dateStamp => @dateStamp, :barber => @barber, :color => @color

	erb "Спасибо, #{@name}! #{@barber} с нетерпением будет ждать Вас #{@dateStamp}!"
=end
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do 

	m = Contact.new params[:contact]
	m.save

	erb "Благодарим Вас за обращение. В ближайшее время мы свяжемся с вами по указанному телефону. Или не свяжемся!"

end

get '/barber/:id' do
	@barber = Barber.find(params[:id])
	erb :barber
end
