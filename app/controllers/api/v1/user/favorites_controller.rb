class Api::V1::User::FavoritesController < ApiBaseController
  def index
    current_user.favorites.map do |favorite|
      conn = Faraday.new("https://api.nasa.gov/neo/rest/v1/neo/#{favorite.neo_reference_id}?api_key=#{ENV['NASA_API_KEY']}")
      response = conn.get
    render json: current_user
  end

  def create

  end
end
