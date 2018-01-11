require 'capybara/dsl'

class NeoHmpg
  include Capybara::DSL

  HOMEPAGE_URL = 'http://localhost:9292/'
  BROWSE_LINK_TEXT = 'Browse NEO Data'
  HOME_LINK_TEXT = 'Home'
  FIRST_NEO_LINK_TEXT = $neo_brws.brws_neo_id(@pgn)['near_earth_objects'][0]['name']
  JPL_LINK_ID = "jpl_link"
  PAGE_NAV = "page_nav"
  PAGE_NAV_SEL_TEXT = 5

  def visit_home_page
    visit(HOMEPAGE_URL)
  end

  def find_browse_link
    find_link(BROWSE_LINK_TEXT)
  end

  def click_browse_link
    click_link(BROWSE_LINK_TEXT)
  end

  def find_home_link
    find_link(HOME_LINK_TEXT)
  end

  def click_home_link
    click_link(HOME_LINK_TEXT)
  end

  def find_first_neo_link
    find_link(FIRST_NEO_LINK_TEXT)
  end

  def click_first_neo_link
    click_link(FIRST_NEO_LINK_TEXT)
  end

  def find_jpl_link
    find_link(JPL_LINK_ID)
  end

  def click_jpl_link
    click_link(JPL_LINK_ID)
  end

  def find_page_nav_link
    find_link(PAGE_NAV_SEL_TEXT)
  end

  def click_page_nav_link
    click_link(PAGE_NAV_SEL_TEXT)
  end
end
