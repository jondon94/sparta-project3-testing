require 'capybara/dsl'

class NeoHmpg
  include Capybara::DSL

  HOMEPAGE_URL = 'http://localhost:9292/'
  BROWSE_LINK_TEXT = 'Browse NEO Data'

  def visit_home_page
    visit(HOMEPAGE_URL)
  end

  def find_browse_link
    find_link(BROWSE_LINK_TEXT)
  end

  def click_browse_link
    click_link(BROWSE_LINK_TEXT)
  end

end
