class FavoritedAsteroid

  def initialize(favorite, current_user)
    @favorite     = favorite
    @current_user = current_user
  end

  def json_response_create
    {
      id: favorite.id,
      neo_reference_id: parsed_json[:neo_reference_id],
      user_id: current_user.id,
      asteroid: {
        name: parsed_json[:name],
        is_potentially_hazardous_asteroid: parsed_json[:is_potentially_hazardous_asteroid]
      }
    }
  end

  def json_response_index
    favorites_json.map do |json|
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
  end

  private

    attr_reader :favorite, :current_user, :favorites_json

    def favorites_json
      current_user_favorites_json.map! do |json|
        JSON.parse(json.body, symbolize_names: true)
      end
    end

    def current_user_favorites_json
      current_user.favorites.map do |favorite|
        response(favorite)
      end
    end

    def conn(favorite)
      Faraday.new("https://api.nasa.gov/neo/rest/v1/neo/#{favorite.neo_reference_id}?api_key=#{ENV['NASA_API_KEY']}")
    end

    def response(favorite)
      conn(favorite).get
    end

    def parsed_json
      parsed_json = JSON.parse(response(favorite).body, symbolize_names: true)
    end

end
