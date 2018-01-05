require 'spec_helper'

describe 'users should be able to navigate around the website' do

  context 'users should be able to use the nav bar to acess different pages' do

    it "should send users to the relevant page when clicked" do
      @neo_site = NeoDataTestClass.new
      @neo_site.nav_test.visit_home_page
    end
  end
end
