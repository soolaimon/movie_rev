class Review < ActiveRecord::Base
  include RottenTomatoes

  before_create :set_rt_data

  def freshness
    fresh? ? "fresh" : "rotten"
  end

  def rt_movie
    @rt_movie ||= RottenTomatoes::MovieRequest.new(id: rt_id).obj
  end

  def rt_reviews
    @rt_reviews ||= RottenTomatoes::MovieRequest.new(url: rt_movie["links"]["reviews"]).obj["reviews"]
  end

  def rt_similar
    @rt_similar ||= RottenTomatoes::MovieRequest.new(url: rt_movie["links"]["similar"]).obj
  end

  def top_fresh_percentage
    total_freshness = rt_reviews.map{ |review| review["freshness"] }
    total_freshness << freshness
    fresh_reviews = total_freshness.select { |freshness| freshness if freshness == "fresh" }
    (fresh_reviews.count.to_f / total_freshness.count.to_f) * 100
  end

  private

  def set_rt_data
    movie = RottenTomatoes::MovieRequest.new(q: title)
    self.rt_id =  movie.obj["id"]
    self.rt_poster_profile = movie.obj["posters"]["profile"]
    self.rt_poster_thumb = movie.obj["posters"]["thumbnail"]
    true
  end

end
