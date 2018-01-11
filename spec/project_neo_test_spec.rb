
require 'spec_helper'
require 'sinatra'
require 'sinatra/reloader'

describe NeoDataTestClass do

  context 'requesting information on a Near Earth Object' do

    before(:all) do
      @neocode = CurrentNeoData.new
    end

    it "should have the information of the NEO as a Hash" do
      expect(@neocode.get_neo_id(3729835)).to be_kind_of(Hash)
    end

    it "should have nine keys in the hash" do
      expect(@neocode.get_neo_id(3729835).keys.length).to eq(9)
    end

    it "should have an string for the id parameter" do
      expect(@neocode.get_neo_id(3729835)['neo_reference_id'].to_i).to be_kind_of(Integer)
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

    it "should contain an number value for the magnitude" do
      expect(@neocode.get_neo_id(3729835)['absolute_magnitude_h']).to be_kind_of(Float)
    end

    it "should contain 4 hash keys for the estmated diamter in different units" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter'].keys.length).to eq(4)
    end

    it "should contain the estmated diameter in different units including km, m, miles, feet" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter'].keys).to include("kilometers" && "meters" && "miles" && "feet")
    end

    it "should have 2 values for kilometers of estimated diameter" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['kilometers'].length).to eq(2)
    end

    it "should include a minimum and maximum value for estimated_diameter (kilometers)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['kilometers']).to include("estimated_diameter_min" && "estimated_diameter_max")
    end

    it "should include a Float value for estimated_diameter_min (kilometers)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['kilometers']["estimated_diameter_min"]).to be_kind_of(Float)
    end

    it "should include a Float value for estimated_diameter_max (kilometers)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['kilometers']["estimated_diameter_max"]).to be_kind_of(Float)
    end

    it "should have 2 values for meters of estimated diameter" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['meters'].length).to eq(2)
    end

    it "should include a minimum and maximum value for estimated_diameter (meters)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['meters']).to include("estimated_diameter_min" && "estimated_diameter_max")
    end

    it "should include a Float value for estimated_diameter_min (meters)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['meters']["estimated_diameter_min"]).to be_kind_of(Float)
    end

    it "should include a Float value for estimated_diameter_max (meters)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['meters']["estimated_diameter_max"]).to be_kind_of(Float)
    end

    it "should have 2 values for miles of estimated diameter" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['miles'].length).to eq(2)
    end

    it "should include a minimum and maximum value for estimated_diameter (miles)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['miles']).to include("estimated_diameter_min" && "estimated_diameter_max")
    end

    it "should include a Float value for estimated_diameter_min (miles)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['miles']["estimated_diameter_min"]).to be_kind_of(Float)
    end

    it "should include a Float value for estimated_diameter_max (miles)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['miles']["estimated_diameter_max"]).to be_kind_of(Float)
    end

    it "should have 2 values for feet of estimated diameter" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['feet'].length).to eq(2)
    end

    it "should include a minimum and maximum value for estimated_diameter (feet)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['feet']).to include("estimated_diameter_min" && "estimated_diameter_max")
    end

    it "should include a Float value for estimated_diameter_min (feet)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['feet']["estimated_diameter_min"]).to be_kind_of(Float)
    end

    it "should include a Float value for estimated_diameter_max (feet)" do
      expect(@neocode.get_neo_id(3729835)['estimated_diameter']['feet']["estimated_diameter_max"]).to be_kind_of(Float)
    end

    it "should have 5 parameters in the close approach data" do
      expect(@neocode.get_neo_id(3729835)['close_approach_data'][2].length).to eq(5)
    end

    it "should have 3 keys for the relative velocity data" do
      expect(@neocode.get_neo_id(3729835)['close_approach_data'][2]['relative_velocity'].length).to eq(3)
    end

    it "should have a kilometers per second key with a float value" do
      expect(@neocode.get_neo_id(3729835)['close_approach_data'][2]['relative_velocity']['kilometers_per_second'].to_f).to be_kind_of(Float)
    end

    it "should have a kilometers per hour key with a float value" do
      expect(@neocode.get_neo_id(3729835)['close_approach_data'][2]['relative_velocity']['kilometers_per_hour'].to_f).to be_kind_of(Float)
    end

    it "should have a miles per hour key with a float value" do
      expect(@neocode.get_neo_id(3729835)['close_approach_data'][2]['relative_velocity']['miles_per_hour'].to_f).to be_kind_of(Float)
    end

    it "should have 4 keys for the miss distance data" do
      expect(@neocode.get_neo_id(3542519)['close_approach_data'][2]['miss_distance'].length).to eq(4)
    end

    it "should have the Astrnomical units as a float value" do
      expect(@neocode.get_neo_id(3729835)['close_approach_data'][2]['miss_distance']['astronomical'].to_f).to be_kind_of(Float)
    end

    it "should have the Lunar units as a float value" do
      expect(@neocode.get_neo_id(3729835)['close_approach_data'][2]['miss_distance']['lunar'].to_f).to be_kind_of(Float)
    end

    it "should have the kilometers units as a float value" do
      expect(@neocode.get_neo_id(3729835)['close_approach_data'][2]['miss_distance']['kilometers'].to_f).to be_kind_of(Float)
    end

    it "should have the miles as a float value" do
      expect(@neocode.get_neo_id(3729835)['close_approach_data'][2]['miss_distance']['miles'].to_f).to be_kind_of(Float)
    end

    it "should have a string for the orbital body of the NEO" do
      expect(@neocode.get_neo_id(3729835)['close_approach_data'][2]['orbiting_body']).to be_kind_of(String)
    end

    it "should have 18 keys in the orbital data key" do
      expect(@neocode.get_neo_id(3729835)['orbital_data'].length).to eq(18)
    end

    it "should have an integer value for the orbital id value" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['orbit_id'].to_i).to be_kind_of(Integer)
    end

    it "should have an integer value as the uncertainty value of an orbit" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['orbit_uncertainty'].to_i).to be_kind_of(Integer)
    end

    it "should contain a float value for the minimum_orbit_intersection parameter" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['minimum_orbit_intersection'].to_f).to be_kind_of(Float)
    end

    it "should contain a float value for the jupiter tisserand invariant parameter" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['jupiter_tisserand_invariant'].to_f).to be_kind_of(Float)
    end

    it "should have an eccentricity value between 0 and 1 (and therefore a float value)" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['eccentricity'].to_f).to be_between(0, 1)
    end

    it "should have asemi major axis that is a float value" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['semi_major_axis'].to_f).to be_kind_of(Float)
    end

    it "should have a float value for the inclination of the NEO" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['inclination'].to_f).to be_kind_of(Float)
    end

    it "should have a float as the ascending node longitude value of the NEO" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['ascending_node_longitude'].to_f).to be_kind_of(Float)
    end

    it "should have a float orbital period in days of the NEO" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['orbital_period'].to_f).to be_kind_of(Float)
    end

    it "should have a float of perihilion distance" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['perihelion_distance'].to_f).to be_kind_of(Float)
    end

    it "should have a float for perihilion arguement" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['perihelion_arguement'].to_f).to be_kind_of(Float)
    end

    it "should have a float for aphelion distance" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['aphelion_distance'].to_f).to be_kind_of(Float)
    end

    it "should have a float for perihilion time" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['perihelion_time'].to_f).to be_kind_of(Float)
    end

    it "should have a float for mean motion" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['mean_motion'].to_f).to be_kind_of(Float)
    end

    it "should have a float for mean anomaly" do
      expect(@neocode.get_neo_id(3729835)['orbital_data']['mean_anomaly'].to_f).to be_kind_of(Float)
    end

  end
end
