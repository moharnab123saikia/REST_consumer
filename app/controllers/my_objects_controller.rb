class MyObjectsController < ApplicationController
	require 'rest_client'
	USERNAME = "myfinance" # needed to access the APi
  	PASSWORD = "credit123" # needed to access the APi
  	API_BASE_URL = "http://localhost:3000/api" # base url of the API

  	def index
	    uri = "#{API_BASE_URL}/my_objects" # specifying json format in the URl
	    rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD) # It will createnew rest-client resource so that we can call different methods of it
	    my_objects = rest_resource.get # will get back you all the detail in json format, but itwill we wraped as string, so we will parse it in the next step.
	    @my_objects = JSON.parse(my_objects, :symbolize_names => true) # we will convert the return data into array of hash.see json data parsing here
  	end
end
