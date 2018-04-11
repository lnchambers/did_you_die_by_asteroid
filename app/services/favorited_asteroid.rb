class FavoritedAsteroid

  def initialize(favorite, current_user)
    @favorite     = favorite
    @current_user = current_user
  end

  def json_response
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

  private

    attr_reader :favorite, :current_user

    def conn
      Faraday.new("https://api.nasa.gov/neo/rest/v1/neo/#{favorite.neo_reference_id}?api_key=#{ENV['NASA_API_KEY']}")
    end

    def response
      conn.get
    end

    def parsed_json
      parsed_json = JSON.parse(response.body, symbolize_names: true)
    end

end
