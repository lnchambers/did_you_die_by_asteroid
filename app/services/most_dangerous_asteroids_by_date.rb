class MostDangerousAsteroidsByDate

  def initialize(params)
    @start_date = params[:start_date]
    @end_date = params[:end_date]
  end

  def asteroids
    binding.pry
    AsteroidSearch.new(params).run
  end

end
