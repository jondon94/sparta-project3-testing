require 'capybara/dsl'

class NeoHmpg
  include Capybara::DSL

  HOMEPAGE_URL = 'http://localhost:9292/'
  SIGN_IN_LINK_ID = '#idcta-link'

  def visit_home_page
    visit(HOMEPAGE_URL)
  end

end
