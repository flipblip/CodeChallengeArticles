require_relative './module'
class Magazine
  attr_accessor :name, :category
  extend Finder

  @@all = []


  def initialize(name, category)
    @name = name
    @category = category

    @@all << self

  end

  def name
    @name
  end

  def category
    @category
  end

  def self.all
    @@all
  end

  # def authors
  #   Authors.all.select {|author| author.name == @name}
  # end

  def all_articles
    Article.all.filter { |article| article.magazine.name == @name}
  end

  def all_authors
    all_articles.map { |article| 
    Author.find_by_name(article.author)}
  end

  def contributors
    # Authors.all.find { |author| author == @uthor}
    all_authors.uniq
  end

  def article_titles
    all_articles.tally.each { |key, value| value > 2 && (main_authors << key)}
    main_authors
  end


end

