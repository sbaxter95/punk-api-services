require 'spec_helper'
require_relative '../beers_object.rb'

describe 'testing beer api' do

  before(:all) do
      beer_service = BeerServices.new
      @beer = beer_service.single_beer_service('1') #Need to instantiate new instance of PostcodesService class
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

  end

end
