require 'spec_helper'

describe 'users should be able to navigate around the website' do

  context 'users should be able to use the nav bar to acess different pages' do

    it "should send users to a specific NEO when directed there." do
      @neo_site = NeoDataTestClass.new
      @neo_site.nav_test.visit_home_page
      @neo_site.nav_test.click_browse_link
      @neo_site.nav_test.click_first_neo_link
      sleep 2
    end

    it "should send you to the nasa jpl url when clicked" do
      @neo_site = NeoDataTestClass.new
      @neo_site.nav_test.visit_home_page
      @neo_site.nav_test.click_browse_link
      @neo_site.nav_test.click_first_neo_link
      @neo_site.nav_test.click_jpl_link
      sleep 2
    end

    it "should send you to correct page number when link is clicked" do
      @neo_site = NeoDataTestClass.new
      @neo_site.nav_test.visit_home_page
      @neo_site.nav_test.click_browse_link
      @neo_site.nav_test.click_page_nav_link
      sleep 2
    end

    it "should send you to homepage when clicked form any page" do
      @neo_site = NeoDataTestClass.new
      @neo_site.nav_test.visit_home_page
      @neo_site.nav_test.click_browse_link
      @neo_site.nav_test.click_page_nav_link
      @neo_site.nav_test.click_home_link
      sleep 2
    end
  end
end
