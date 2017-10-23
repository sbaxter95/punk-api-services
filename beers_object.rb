require 'httparty'
require 'json'

class BeerServices
  include HTTParty

  base_uri 'https://api.punkapi.com/v2/'

  def initialize
    @params_array = %w(abv_gt abv_lt ibu_gt ibu_lt ebc_gt ebc_lt beer_name yeast brewed_before brewed_after hops malt food ids)
    @k_array = []
    @v_array = []
    @url = ""
  end

  def single_beer_service(beer_id)
    JSON.parse(self.class.get("/beers/#{beer_id}").body)
  end

  def all_beers_service

  end

  def random_beer_service

  end

  def check_for_params(hash)
    hash.each do |k,v|
      if @params_array.include?(k)
        @k_array.push(k)
        @v_array.push(v)
      else
        raise 'No matches'
      end
    end
    @k_array
    @v_array
  end

  def add_params_to_url
    if @k_array.length > 0 && @v_array.length > 0
      if @k_array.length == 1 && @v_array.length == 1
        @url << "?#{@k_array[0]}=#{@v_array[0]}"
      else
        @url << "?#{@k_array[0]}=#{@v_array[0]}"
        for i in 1..(@k_array.length)-1 do
          @url << "&#{@k_array[i]}=#{@v_array[i]}"
        end
      end
    end
  end

  def search_beers
    JSON.parse(self.class.get("/beers#{@url}").body)
  end
  
end

beer = BeerServices.new
# p beer.single_beer_service('5')
beer.check_for_params({'yeast' => 'Wyeast_1056_-_American_Ale', 'abv_gt' => 8})
beer.add_params_to_url
p beer.search_beers
