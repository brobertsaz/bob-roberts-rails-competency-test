require 'test_helper'

class ArticleFlowTest < Capybara::Rails::TestCase
  test 'articles index' do
    visit articles_path

    assert page.has_content?('Sign Up')
  end
end
