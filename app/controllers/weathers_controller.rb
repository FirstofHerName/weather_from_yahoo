class WeathersController < ApplicationController

  def index
    city = params[:city] || "Chicago"
    state = papams[:state] || "IL"

  response = Unirest.get('https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22chicago%2C%20il%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys').body

   channel = response["query"]["results"]["channel"]
   @temp = channel["item"]["condition"]["temp"]
   @state = channel["location"]["region"]
   @city = channel["location"]["city"]
   @forecast = channel["item"]["forecast"]
  end
end

