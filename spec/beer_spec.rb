require 'spec_helper'
require_relative '../beers_object.rb'

describe 'testing beer api' do

  before(:all) do
      beer_service = BeerServices.new
      @beer = beer_service.single_beer_service('1') #Need to instantiate new instance of PostcodesService class
    end

  context 'single beer' do

    it "should be a string passed into the single beer method" do
      expect(@beer[0]['id']).to be_kind_of(Integer)
    end

  end

end
