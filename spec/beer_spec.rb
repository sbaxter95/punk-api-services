require 'spec_helper'
require_relative '../beers_object.rb'

describe 'testing beer api' do

  before(:all) do
      beer_service = BeerServices.new
      @beer = beer_service.single_beer_service('6') #Need to instantiate new instance of PostcodesService class
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

    it 'should have an ebc that is an integer' do
      expect(@beer[0]['ebc']).to be_kind_of(Integer)
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

end
