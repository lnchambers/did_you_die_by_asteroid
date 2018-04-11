class MostDangerousAsteroidsByDate

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def asteroids
    AsteroidSearch.new(start_date, end_date).run.values.flatten.map do |raw_asteroid|
      Asteroid.new(raw_asteroid)
    end
  end

  private

    attr_reader :start_date, :end_date

end
