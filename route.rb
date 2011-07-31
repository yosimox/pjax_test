#! ruby -Ku
# -*- coding: utf-8 -*-
#Encoding.default_external = "utf-8"
#Encoding.default_internal = "utf-8"


require 'rubygems'
require 'sinatra'
require 'haml'
require 'pp'

helpers do
	def get_data(page_name)
		page_name.gsub!(":", "")
		f = File::open("datas/#{page_name}")
		str = ""
		f.each do |line|
			str += line
		end
		data = {
			:title => "PJAX TEST >> #{page_name}",
			:section => str
		}
		return data
	end
end


get '/' do
	@data = get_data("index")
  haml :index
end

get '/neko' do
	"nekoenk"
end

get '/:name' do
  page_name = params[:name]
  @data = get_data(page_name)
  if(request.env["HTTP_X_PJAX"])
    "<title>" + @data[:title] + "</title>" + @data[:section]
  else
    haml :index
  end
end

