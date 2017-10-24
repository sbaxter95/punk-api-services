require 'spec_helper'
require_relative '../beers_object.rb'

describe 'testing beer api' do

  before(:all) do
      beer_service = BeerServices.new
      @beer = beer_service.search_beers({'yeast' => 'Wyeast_1056_-_American_Ale', 'abv_gt' => 8})
      @beer_function_check = BeerServices.new
      @beer_params_check = BeerServices.new
      @beer_params_check.search_beers({'yeast' => 'Wyeast_1056_-_American_Ale', 'abv_gt' => 8})
      @beer_random = BeerServices.new
    end

  context 'single beer' do

    it "should have an id thats an integer" do
      expect(@beer[0]['id']).to be_kind_of(Integer)
    end

    it 'should return an array' do
      expect(@beer).to be_kind_of(Array)
    end

    it 'should have a name that is a string' do
      expect(@beer[0]['name']).to be_kind_of(String)
    end

    it 'should have an abv that is a float' do
      expect(@beer[0]['abv']).to be_kind_of(Float)
    end

    it 'should have an ibu that is an integer' do
      expect(@beer[0]['ibu']).to be_kind_of(Integer)
    end

    it 'should have a yeast that is a string' do
      expect(@beer[0]['ingredients']['yeast']).to be_kind_of(String)
    end

    it 'should have a first_brewed that is a string' do
      expect(@beer[0]['first_brewed']).to be_kind_of(String)
    end

    it 'should have a hops array' do
      expect(@beer[0]['ingredients']['hops']).to be_kind_of(Array)
    end

    it 'should have a malt array' do
      expect(@beer[0]['ingredients']['malt']).to be_kind_of(Array)
    end

    it 'should have a food_pairing array' do
      expect(@beer[0]['food_pairing']).to be_kind_of(Array)
    end

    it 'should have a beer that is returned' do
      expect(@beer[0]).not_to be_empty
    end

  end

  context 'all beers' do

    it 'should have multiple beers that are returned' do
      expect(@beer.length).to be > 1
    end

    it "should have an id thats an integer" do
      expect(@beer[0]['id']).to be_kind_of(Integer)
    end

    it 'should return an array' do
      expect(@beer).to be_kind_of(Array)
    end

    it 'should have a name that is a string' do
      expect(@beer[0]['name']).to be_kind_of(String)
    end

    it 'should have an abv that is a float' do
      expect(@beer[0]['abv']).to be_kind_of(Float)
    end

    it 'should have an ibu that is an integer' do
      expect(@beer[0]['ibu']).to be_kind_of(Integer)
    end

    it 'should have a yeast that is a string' do
      expect(@beer[0]['ingredients']['yeast']).to be_kind_of(String)
    end

    it 'should have a first_brewed that is a string' do
      expect(@beer[0]['first_brewed']).to be_kind_of(String)
    end

    it 'should have a hops array' do
      expect(@beer[0]['ingredients']['hops']).to be_kind_of(Array)
    end

    it 'should have a malt array' do
      expect(@beer[0]['ingredients']['malt']).to be_kind_of(Array)
    end

    it 'should have a food_pairing array' do
      expect(@beer[0]['food_pairing']).to be_kind_of(Array)
    end

    it 'should have a beer that is returned' do
      expect(@beer[0]).not_to be_empty
    end

  end

  context 'testing search service' do

    it 'should check that there are parameters to search' do
      expect(@beer_function_check.k_array).not_to eq('null')
    end

    it 'should ensure the correct parameters are present' do
      expect(@beer_params_check.k_array).to eq(['yeast', 'abv_gt'])
    end

    it 'should ensure that there is a question mark in the url' do
      expect(@beer_params_check.url).to include('?')
    end

    it 'should ensure that there are ampersands if relevant' do
      if @beer_params_check.k_array.length > 1
        expect(@beer_params_check.url).to include('&')
      end
    end

  end

  context 'testing random service' do

    it 'should return 1 beer' do
      beer = @beer_random.random_beer_service
      expect(beer.length).to eq 1
    end

    it 'should return an array' do
      beer = @beer_random.random_beer_service
      expect(beer).to be_kind_of(Array)
    end

  end

end
