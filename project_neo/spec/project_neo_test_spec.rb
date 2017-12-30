require 'spec_helper'
require 'sinatra'
require 'sinatra/reloader'

describe NeoDataTestClass do

  context 'requesting information on a Near Earth Object' do

    before(:each) do
      @neocode = CurrentNeoData.new
    end

    it "should have the information of the NEO as a Hash" do
      expect(@neocode.neo_ex_id).to be_kind_of(Hash)
    end
  end

end
