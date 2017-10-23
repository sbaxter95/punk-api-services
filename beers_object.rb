require 'httparty'
require 'json'

class BeerServices
  include HTTParty

  base_uri 'https://api.punkapi.com/v2/'

  def initialize
    @params_array = %w(abv_gt abv_lt ibu_gt ibu_lt ebc_gt ebc_lt beer_name yeast brewed_before brewed_after hops malt food ids)
  end

  def single_beer_service(beer_id)
    JSON.parse(self.class.get("/beers/#{beer_id}").body)
  end

  def all_beers_service

  end

  def random_beer_service

  end

  def query_beers_service(hash)
    hash.each do |k,v|
      if @params_array.include?(k)
        puts v
      end
    end
  end

end

beer = BeerServices.new
# p beer.single_beer_service('5')
p beer.query_beers_service('yeast' => 'test')
