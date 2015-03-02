class Review < ActiveRecord::Base
  include RottenTomatoes

  before_create :set_rt_data

  def rt_movie
    @rt_movie ||= RottenTomatoes::MovieRequest.new(id: rt_id).obj
  end


  def rt_reviews
   @rt_reviews ||= RottenTomatoes::MovieRequest.new(url: rt_movie["links"]["reviews"])
  end

  def rt_similar
    @rt_similar ||= RottenTomatoes::MovieRequest.new(url: rt_movie["links"]["similar"])
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
