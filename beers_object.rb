require 'httparty'
require 'json'

class BeerServices
  include HTTParty

  base_uri 'https://api.punkapi.com/v2/'

  def single_beer_service(beer_id)
    JSON.parse(self.class.get("/beers/#{beer_id}").body)
  end

  def all_beers_service

  end

  def random_beer_service

  end

  def query_beers_service

  end

end

beer = BeerServices.new
p beer.single_beer_service('5')
