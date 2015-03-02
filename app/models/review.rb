class Review < ActiveRecord::Base
  include RottenTomatoes

  before_create :set_rt_data

  private

  def set_rt_data
    movie = RottenTomatoes::MovieRequest.new(q: title)
    self.rt_id =  movie.obj["id"]
    self.rt_poster_profile = movie.obj["posters"]["profile"]
    self.rt_poster_thumb = movie.obj["posters"]["thumbnail"]
    true
  end

end
