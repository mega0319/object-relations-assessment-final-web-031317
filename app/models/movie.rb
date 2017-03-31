class Movie

  ALL = []

  attr_accessor :title

  def initialize(title)
    self.title = title
    ALL << self
  end

  def self.all
    ALL
  end

  def self.find_by_title(title)
    self.all.find do |movie_instance|
      movie_instance.title == title
    end
  end

  def ratings
    Rating.all.select do |rating_instances|
      rating_instances.movie == self
    end
  end

  def viewers
    Rating.all.map do |rating_instances|
      rating_instances.viewer
    end
  end

  def scores
    self.ratings.map do |own_review|
      own_review.score
    end
  end


  def average_rating
    x = self.scores.inject do |sum, each_score|
      sum + each_score
    end
    x/(self.scores.count).to_f
  end

  # def self.create_if_not_exists(movie_title)
  #   x = ""
  #   binding.pry
  #   Movie.all.each do |movie_instance|
  #     binding.pry
  #     if movie_instance.title == movie_title
  #       return movie_instance
  #     else
  #       x = Movie.new(movie_title)
  #       return x
  #     end
  #   end
  # end
end
