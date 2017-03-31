class Viewer

  ALL = []

  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    ALL << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    ALL
  end

  def self.find_by_name(full_name)
    self.all.find do |viewer|
      viewer.full_name == full_name
    end
  end

  def create_rating(score, movie)
    if Movie.find_by_title(movie)
      new_m = Movie.find_by_title(movie)
      new_r = Rating.new(score, new_m, self)
    else
      new_m = Movie.new(movie)
      new_r = Rating.new(score, new_m, self)
    end
  end
end
