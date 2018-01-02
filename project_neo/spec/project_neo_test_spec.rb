require 'spec_helper'
require 'sinatra'
require 'sinatra/reloader'

describe NeoDataTestClass do

  context 'requesting information on a Near Earth Object' do

    before(:each) do
      @neocode = CurrentNeoData.new
    end

    it "should have the information of the NEO as a Hash" do
      expect(@neocode.get_neo_id(3729835)).to be_kind_of(Hash)
    end

    it "should have nine keys in the hash" do
      expect(@neocode.get_neo_id(3729835).keys.length).to eq(9)
    end

    it "should have an string for the id parameter" do
      expect(@neocode.get_neo_id(3729835)['neo_reference_id']).to be_kind_of(String)
    end

    it "should contain a links parameter with a hash length of 1" do
      expect(@neocode.get_neo_id(3729835)['links'].length).to eq(1)
    end

    it "should contain a name parameter to be a kind of string" do
      expect(@neocode.get_neo_id(3729835)['name']).to be_kind_of(String)
    end

    it "should contain a html as a string" do
      expect(@neocode.get_neo_id(3729835)['nasa_jpl_url']).to be_kind_of(String)
    end

    it "should contain http:// in the html string" do
      expect(@neocode.get_neo_id(3729835)['nasa_jpl_url']).to include('http://')
    end

    it "should contain a truthy falsy parameter for is potentially hazardous" do
      expect(@neocode.get_neo_id(3729835)['is_potentially_hazardous_asteroid']).to eq(true || false)
    end

  end
end
