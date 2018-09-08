require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  before do
    @user = User.create(email: 'test@example.com', password: 'password')
  end

  test 'valid article' do
    article = Article.new(category: Article::CATEGORIES.sample,
                          title: Faker::Lorem.sentence(4),
                          content: Faker::Lorem.paragraph(4),
                          user: @user)
    assert article.valid?
  end

  test 'invalid without category' do
    article = Article.new(title: Faker::Lorem.sentence(4),
                          content: Faker::Lorem.paragraph(4),
                          user: @user)
    refute article.valid?
    assert_not_nil article.errors[:category]
  end

  test 'invalid without user' do
    article = Article.new(category: Article::CATEGORIES.sample,
                          title: Faker::Lorem.sentence(4),
                          content: Faker::Lorem.paragraph(4))
    refute article.valid?
    assert_not_nil article.errors[:user]
  end

  test 'invalid without content' do
    article = Article.new(category: Article::CATEGORIES.sample,
                          title: Faker::Lorem.sentence(4),
                          user: @user)
    refute article.valid?
    assert_not_nil article.errors[:content]
  end

  test 'invalid without title' do
    article = Article.new(category: Article::CATEGORIES.sample,
                          content: Faker::Lorem.paragraph(4),
                          user: @user)
    refute article.valid?, 'article is valid without a category'
    assert_not_nil article.errors[:category], 'no validation error for category present'
  end
end
