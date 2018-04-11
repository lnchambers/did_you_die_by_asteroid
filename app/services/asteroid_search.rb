class AsteroidSearch

  def initialize(params)
    @start_date = params[:start_date]
    @end_date = params[:end_date]
  end

  def run
    parse(response)
  end

  private

    attr_reader :start_date, :end_date

    def conn
      Faraday.new("https://api.nasa.gov/neo/rest/v1/feed?start_date=#{start_date}&end_date=#{end_date}&api_key=#{ENV['NASA_API_KEY']}")
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def response
      conn.get
    end

end
