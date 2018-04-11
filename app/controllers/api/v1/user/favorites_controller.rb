class Api::V1::User::FavoritesController < ApiBaseController
  def index
    favorites_json = current_user.favorites.map do |favorite|
      conn = Faraday.new("https://api.nasa.gov/neo/rest/v1/neo/#{favorite.neo_reference_id}?api_key=#{ENV['NASA_API_KEY']}")
      conn.get
    end

    favorites_json.map! do |json|
      JSON.parse(json.body, symbolize_names: true)
    end

    built_json = favorites_json.map do |json|
      {
        id: Favorite.find_by(neo_reference_id: json[:neo_reference_id]).id,
        neo_reference_id: json[:neo_reference_id],
        user_id: current_user.id,
        asteroid: {
          name: json[:name],
          is_potentially_hazardous_asteroid: json[:is_potentially_hazardous_asteroid]
        }
      }
    end

    render json: built_json
  end

  def create
    favorite = Favorite.new(neo_reference_id: params[:neo_reference_id], user: current_user)
    if favorite.save
      render json: FavoritedAsteroid.new(favorite, current_user).json_response
    else
      render json: { message: "Invalid credentials." }
    end
  end

end
