module  RottenTomatoes
  API_KEY = Rails.application.secrets.rotten_tomatoes_key
  BASE_URL = "http://api.rottentomatoes.com/api/public/v1.0/"

  class MovieRequest

    attr_reader :id, :obj

    def initialize(params = {})
      if params[:q]
        @obj = JSON.parse(HTTParty.get("#{BASE_URL}movies?apikey=#{API_KEY}&q=#{params[:q]}"))["movies"].first
      elsif params[:id]
        @obj = JSON.parse(HTTParty.get("#{BASE_URL}movies/#{params[:id]}.json?apikey=#{API_KEY}"))
      elsif params[:url]
        @obj = JSON.parse(HTTParty.get(params[:url] + "?apikey=#{API_KEY}"))
      end
      @id = @obj["id"]
    end


  end

end
