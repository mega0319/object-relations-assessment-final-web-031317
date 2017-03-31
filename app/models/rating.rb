class Rating

  ALL = []

  attr_accessor :score, :movie, :viewer

  def initialize(score, movie, viewer)
    @score = score
    @movie = movie
    @viewer = viewer
    ALL << self
  end

  def self.all
    ALL
  end
end
